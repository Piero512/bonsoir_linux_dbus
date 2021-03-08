import 'avahi_defs/server.dart';
import 'linux_dbus_bonsoir_events.dart';
import 'dart:async';
import 'avahi_defs/service_browser.dart';
import 'package:dbus/dbus.dart';
import 'avahi_defs/constants.dart';
import 'package:bonsoir_platform_interface/events/discovery_event.dart';
import 'package:bonsoir_platform_interface/service/service.dart';
import 'package:bonsoir_platform_interface/service/resolved_service.dart';

class LinuxDBusBonsoirDiscovery
    extends LinuxDBusBonsoirEvents<BonsoirDiscoveryEvent> {
  final String type;
  StreamController<BonsoirDiscoveryEvent> _controller;
  bool _isStopped = false;
  final bool _printLogs;
  AvahiServiceBrowser _browser;
  Map<String, StreamSubscription> _subscriptions = {};
  Map<String, ResolvedBonsoirService> _resolvedServices = {};
  StreamSubscription _customListener;
  LinuxDBusBonsoirDiscovery(this.type, this._printLogs);
  List<AvahiServiceBrowserItemNew> _pendingServices = [];
  @override
  Stream<BonsoirDiscoveryEvent> get eventStream => _controller?.stream;

  @override
  bool get isReady => _controller != null && !_isStopped;

  @override
  bool get isStopped => _isStopped;

  @override
  Future<void> get ready async {
    var version = (await server.callGetVersionString()).split(" ").last;
    var mayor = int.parse(version.split(".").first);
    var minor = int.parse(version.split(".").last);
    if (mayor <= 0 && minor <= 7) {
      print(
          "Enabling workaround for V1 API with the 100ms wait behavior. Update your Avahi version to 0.8 or later if you want this warning to disappear.");
      _customListener = busClient
          .subscribeSignals(
              sender: 'org.freedesktop.Avahi',
              interface: 'org.freedesktop.Avahi.ServiceBrowser',
              member: 'ItemNew')
          .listen((signal) {
        var event = AvahiServiceBrowserItemNew(signal);
        if (event.type == this.type) {
          print("Cached service received: ${event.friendlyString}");
          _pendingServices.add(event);
        }
      });

      /// Waiting for the DBus selector
      await Future.delayed(Duration(milliseconds: 100));
    }
    var serviceBrowserPath = await server.callServiceBrowserNew(
        AvahiIfIndexUnspecified, AvahiProtocolUnspecified, type, "", 0);
    _browser = AvahiServiceBrowser(busClient, 'org.freedesktop.Avahi',
        path: DBusObjectPath(serviceBrowserPath));
  }

  @override
  Future<void> start() async {
    _controller = StreamController.broadcast();
    _controller.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STARTED));
    _subscriptions['ItemNew'] =
        _browser.subscribeItemNew().listen((event) async {
      print("Item added! ${event.friendlyString}");
      _controller.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND,
          service:
              BonsoirService(name: event.name, type: event.type, port: null),
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
      _controller.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST,
          service: toRemove,
        ),
      );
    });
    await _browser.callStart();
    _controller.addStream(
      Stream.fromIterable(
        _pendingServices.map(
          (event) {
            resolveService(event);
            return BonsoirDiscoveryEvent(
              type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND,
              service: BonsoirService(
                name: event.name,
                type: event.type,
                port: null,
              ),
            );
          },
        ),
      ),
    ).then((_) => _pendingServices = []);
  }

  Future<void> resolveService(AvahiServiceBrowserItemNew newService) async {
    var key =
        '${newService.protocol}.${newService.interfaceValue}.${newService.name}.${newService.type}';
    print("DBG: ${newService.friendlyString}");
    var reply = AvahiServerResolvedService(await server.callResolveService(
        interface: newService.interfaceValue,
        protocol: newService.protocol,
        name: newService.name,
        type: newService.type,
        domain: newService.domain,
        answerProtocol: AvahiProtocolUnspecified,
        flags: 0));
    print("Service Resolved!");
    var resolvedBonsoirService = ResolvedBonsoirService(
      name: reply.name,
      type: reply.type,
      port: reply.port,
      ip: reply.address,
      attributes: Map.fromEntries(reply.txt
          .map((e) => MapEntry(e.split("=").first, e.split("=").last))),
    );
    _resolvedServices[key] = resolvedBonsoirService;
    _controller.add(
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
      entries.value.cancel();
    }
    _customListener?.cancel();
    _controller.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STOPPED));
    _isStopped = true;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': _browser.path.toString(),
      'printLogs': _printLogs,
      'type': type
    };
  }
}
