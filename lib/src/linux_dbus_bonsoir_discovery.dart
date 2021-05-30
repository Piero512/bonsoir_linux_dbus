import 'avahi_defs/server.dart';
import 'avahi_defs/server2.dart';
import 'linux_dbus_bonsoir_events.dart';
import 'dart:async';
import 'avahi_defs/service_browser.dart';
import 'package:dbus/dbus.dart';
import 'avahi_defs/constants.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';

class LinuxDBusBonsoirDiscovery
    extends LinuxDBusBonsoirEvents<BonsoirDiscoveryEvent> {
  // Type of service to search
  final String type;
  // Browser object from DBus
  late AvahiServiceBrowser _browser;
  // Map of found system names to subscriptions to ServiceBrowser signals.
  Map<String, StreamSubscription> _subscriptions = {};
  // Map of found system names to resolved addresses. Used to send removed services.
  Map<String, ResolvedBonsoirService> _resolvedServices = {};

  // Constructor. Receives service type and passes printLogs to parent class constructor.
  LinuxDBusBonsoirDiscovery(this.type, printLogs) : super(printLogs);

  // Check for Avahi daemon version and set-up the workaround if needed
  // else use v2 API.
  @override
  Future<void> get ready async {
    var version = (await server.callGetVersionString()).split(" ").last;
    var mayor = int.parse(version.split(".").first);
    var minor = int.parse(version.split(".").last);
    var serviceBrowserPath;
    if (mayor <= 0 && minor <= 7) {
      print("Enabling workaround for V1 API with the 100ms wait behavior. "
          "Update your Avahi version to 0.8 or later if you want this warning to disappear.");
      _subscriptions['workaround'] = busClient
          .subscribeSignals(
              sender: 'org.freedesktop.Avahi',
              interface: 'org.freedesktop.Avahi.ServiceBrowser',
              member: 'ItemNew')
          .listen((signal) {
        var event = AvahiServiceBrowserItemNew(signal);
        if (event.type == this.type) {
          print("Cached service received: ${event.friendlyString}");
          if(controller != null){
            var svc = BonsoirService(
              name: event.name,
              type: event.type,
              port: -1
            );
            controller!.add(
              BonsoirDiscoveryEvent(type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND, service: svc)
            );
            resolveService(event);
          } else {
            throw "Controller is null, even though it shouldn't";
          }
        }
      });

      /// Waiting for the DBus selector to update
      await Future.delayed(Duration(milliseconds: 100));
      serviceBrowserPath = await server.callServiceBrowserNew(
          AvahiIfIndexUnspecified, AvahiProtocolUnspecified, type, "", 0);
    } else {
      print("Using ServerV2 interface");
      var server2 =
          AvahiServer2(busClient, 'org.freedesktop.Avahi', DBusObjectPath('/'));
      serviceBrowserPath = await server2.callServiceBrowserPrepare(
          AvahiIfIndexUnspecified, AvahiProtocolUnspecified, type, "", 0);
    }
    _browser = AvahiServiceBrowser(
        busClient, 'org.freedesktop.Avahi', DBusObjectPath(serviceBrowserPath));
    controller = StreamController();
  }

  @override
  Future<void> start() async {
    controller!.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STARTED));
    _subscriptions['ItemNew'] =
        _browser.subscribeItemNew().listen((event) async {
      print("Item added! ${event.friendlyString}");
      controller!.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND,
          service: BonsoirService(name: event.name, type: event.type, port: -1),
        ),
      );
      resolveService(event);
    });
    _subscriptions['ItemRm'] = _browser.subscribeItemRemove().listen((event) {
      print("Item removed! ${event.friendlyString}");
      var key =
          '${event.protocol}.${event.interfaceValue}.${event.name}.${event.type}';
      var toRemove = _resolvedServices[key];
      _resolvedServices.remove(key);
      controller!.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST,
          service: toRemove,
        ),
      );
    });
    await _browser.callStart();
  }

  Future<void> resolveService(AvahiServiceBrowserItemNew newService) async {
    var key =
        '${newService.protocol}.${newService.interfaceValue}.${newService.name}.${newService.type}';
    dbgPrint("DBG: ${newService.friendlyString}");
    var reply = AvahiServerResolvedService(await server.callResolveService(
        interface: newService.interfaceValue,
        protocol: newService.protocol,
        name: newService.name,
        type: newService.type,
        domain: newService.domain,
        answerProtocol: AvahiProtocolUnspecified,
        flags: 0));
    dbgPrint("Service Resolved!");
    var resolvedBonsoirService = ResolvedBonsoirService(
      name: reply.name,
      type: reply.type,
      port: reply.port,
      ip: reply.address,
      attributes: Map.fromEntries(reply.txt
          .map((e) => MapEntry(e.split("=").first, e.split("=").last))),
    );
    _resolvedServices[key] = resolvedBonsoirService;
    controller!.add(
      BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED,
        service: resolvedBonsoirService,
      ),
    );
  }

  @override
  Future<void> stop() async {
    for (var entries in _subscriptions.entries) {
      // Not awaiting because DBus has a bug where the cancelation never ends?
      await entries.value.cancel();
    }
    controller!.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STOPPED));
    super.stop();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': _browser.path.toString(),
      'printLogs': printLogs,
      'type': type
    };
  }
}
