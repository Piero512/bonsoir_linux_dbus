import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io' show Platform;
import 'package:bonsoir_linux_dbus/bonsoir_linux_dbus.dart';

@TestOn('linux && vm')
void main() {
  group('external_api', () {
    test('Able to create a discovery without D-Bus complaining', () async {
      var api = AvahiBonsoir();
      await api.pickDiscoveryFactory();
      var discover = api.createDiscovery('_bonsoirlinux._tcp', printLogs: true);
      await discover.ready;
      await discover.start();
      // Await the workaround
      await Future.delayed(Duration(seconds: 1));
      await discover.stop();
    });
    test('Able to create a broadcast without D-Bus complaining', () async {
      var api = AvahiBonsoir();
      await api.pickDiscoveryFactory();
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
      var api = AvahiBonsoir();
      await api.pickDiscoveryFactory();
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
      var api = AvahiBonsoir();
      await api.pickDiscoveryFactory();
      const svcName = "Test service for numeration";
      const svcType = "_bonsoire2e._tcp";
      const svcPort = 3000;
      var bcast = api.createBroadcast(
          BonsoirService(name: svcName, type: svcType, port: svcPort),
          printLogs: true);
      var discover = api.createDiscovery(svcType, printLogs: true);
      await Future.wait([bcast.ready, discover.ready]);
      bool resolvedAtLeastOnce = false;
      bool lostAtLeastOnce = false;
      bool foundAtLeastOnce = false;
      final sub = discover.eventStream!.listen((event) {
        if(event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND){
          foundAtLeastOnce = true;
        }
        if(event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED){
          resolvedAtLeastOnce = true;
        }
        if(event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST){
          lostAtLeastOnce = true;
        }
      });
      await bcast.start();
      await discover.start();
      await Future.delayed(Duration(seconds: 5));
      await bcast.stop();
      await Future.delayed(Duration(seconds: 5));
      await discover.stop();
      sub.cancel();
      expect(resolvedAtLeastOnce && lostAtLeastOnce && foundAtLeastOnce, isTrue,
          reason:
              'resolvedAtLeastOnce: $resolvedAtLeastOnce, lostAtleastOnce: $lostAtLeastOnce, foundAtLeastOnce: $foundAtLeastOnce');
    });
  }, skip: Platform.isLinux ? null : "Test can only be run on Linux");
}
