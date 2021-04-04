import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io' show Platform;
import 'package:bonsoir_linux_dbus/bonsoir_linux_dbus.dart';

@TestOn('linux && vm')
void main() {
  group('external_api', () {
    test('Able to create a discovery without D-Bus complaining', () async {
      var api = BonsoirLinuxDBus();
      var discover = api.createDiscovery('_bonsoirlinux._tcp', printLogs: true);
      await discover.ready;
      await discover.start();
      // Await the workaround
      await Future.delayed(Duration(seconds: 1));
      await discover.stop();
    });
    test('Able to create a broadcast without D-Bus complaining', () async {
      var api = BonsoirLinuxDBus();
      var broadcast = api.createBroadcast(
          BonsoirService(
              name: "Bonsoir example service",
              type: "_bonsoirlinux._tcp",
              port: 3000),
          printLogs: true);
      await broadcast.ready;
      await broadcast.start();
      await broadcast.stop();
    });
    test('Broadcast sends expected messages', () async {
      var api = BonsoirLinuxDBus();
      var broadcast = api.createBroadcast(
          BonsoirService(
              name: "Bonsoir example service",
              type: "_bonsoirlinux._tcp",
              port: 3000),
          printLogs: true);
      await broadcast.ready;
      var future = expectLater(
        broadcast.eventStream,
        emitsInOrder([
          predicate<BonsoirBroadcastEvent>(
              (event) =>
                  event.type == BonsoirBroadcastEventType.BROADCAST_STARTED,
              "has type == BROADCAST_STARTED"),
          predicate<BonsoirBroadcastEvent>(
              (event) =>
                  event.type == BonsoirBroadcastEventType.BROADCAST_STOPPED,
              "has type == BROADCAST_STOPPED"),
          emitsDone
        ]),
      );
      await broadcast.start();
      // Wait for the announcement to start.
      await Future.delayed(Duration(seconds: 1));
      await broadcast.stop();
      await future;
    });
  }, skip: Platform.isLinux ? null : "Test can only be run on Linux");
  group('end-to-end', () {
    test('Broadcast name and receive them on service enumeration', () async {
      var api = BonsoirLinuxDBus();
      const svcName = "Test service for numeration";
      const svcType = "_bonsoire2e._tcp";
      const svcPort = 3000;
      var bcast = api.createBroadcast(
          BonsoirService(name: svcName, type: svcType, port: svcPort),
          printLogs: true);
      var discover = api.createDiscovery("_bonsoire2e._tcp", printLogs: true);
      await Future.wait([bcast.ready, discover.ready]);
      bool resolvedAtLeastOnce = false;
      bool lostAtLeastOnce = false;
      bool foundAtLeastOnce = false;
      var expected = expectLater(
          discover.eventStream,
          emitsInAnyOrder([
            predicate<BonsoirDiscoveryEvent>(
                (event) =>
                    event.type == BonsoirDiscoveryEventType.DISCOVERY_STARTED,
                "had eventType DiscoveryStarted"),
            mayEmitMultiple(predicate<BonsoirDiscoveryEvent>((event) {
              var found = event.type ==
                  BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND;
              if (found) {
                foundAtLeastOnce = true;
                return found;
              }
              return false;
            }, "had eventType ServiceFound")),
            mayEmitMultiple(predicate<BonsoirDiscoveryEvent>((event) {
              if (event.type ==
                  BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED) {
                if (event.isServiceResolved) {
                  var resolved = event.service as ResolvedBonsoirService;
                  var matchService = resolved.name == svcName &&
                      resolved.port == svcPort &&
                      resolved.type == svcType &&
                      resolved.ip!.isNotEmpty;
                  if (matchService) {
                    resolvedAtLeastOnce = true;
                    return matchService;
                  }
                }
              }
              return false;
            }, "matches the service type broadcasted first")),
            mayEmitMultiple(predicate<BonsoirDiscoveryEvent>((event) {
              var lost = event.type ==
                  BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST;
              if (lost) {
                lostAtLeastOnce = true;
                return lost;
              }
              return false;
            }, "has eventType == ServiceLost")),
            predicate<BonsoirDiscoveryEvent>(
                (event) =>
                    event.type == BonsoirDiscoveryEventType.DISCOVERY_STOPPED,
                "has eventType == Stopped")
          ]));
      await Future.wait([bcast.start(), discover.start()]);
      await Future.delayed(Duration(seconds: 2));
      await bcast.stop();
      await Future.delayed(Duration(seconds: 2));
      await discover.stop();
      await expected;
      expect(
          resolvedAtLeastOnce && lostAtLeastOnce && foundAtLeastOnce, isTrue);
    });
  });
}
