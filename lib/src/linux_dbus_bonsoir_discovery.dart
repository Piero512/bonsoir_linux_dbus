import 'avahi_defs/server.dart';
import 'linux_dbus_bonsoir_events.dart';
import 'package:bonsoir/bonsoir.dart';
import 'dart:async';
import 'avahi_defs/service_browser.dart';
import 'package:dbus/dbus.dart';
import 'avahi_defs/constants.dart';

class LinuxDBusBonsoirDiscovery
    extends LinuxDBusBonsoirEvents<BonsoirDiscoveryEvent> {
  final String type;
  StreamController<BonsoirDiscoveryEvent> _controller;
  bool _isStopped = false;
  final bool _printLogs;
  AvahiServiceBrowser _browser;
  Map<String, StreamSubscription> _subscriptions = {};
  Map<String, ResolvedBonsoirService> _resolvedServices = {};

  LinuxDBusBonsoirDiscovery(this.type, this._printLogs);

  @override
  Stream<BonsoirDiscoveryEvent> get eventStream => _controller?.stream;

  @override
  bool get isReady => _controller != null && !_isStopped;

  @override
  bool get isStopped => _isStopped;

  @override
  Future<void> get ready async {
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
    await _browser.callStart();
    _subscriptions['ItemNew'] =
        _browser.subscribeItemNew().listen((event) async {
      print("Item added! ${event.friendlyString}");
      await resolveService(event);
      _controller.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND,
          service:
              BonsoirService(name: event.name, type: event.type, port: null),
        ),
      );
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

      _subscriptions['$key-resolve']?.cancel();
      _subscriptions.remove('$key-resolve');
    });
  }

  Future<void> resolveService(AvahiServiceBrowserItemNew newService) async {
    var key =
        '${newService.protocol}.${newService.interfaceValue}.${newService.name}.${newService.type}';
    print("DBG: ${newService.friendlyString}");
    var reply = AvahiServerResolvedService(await server.callResolveService(
        newService.interfaceValue,
        newService.protocol,
        newService.name,
        newService.type,
        newService.domain,
        AvahiProtocolUnspecified,
        0));
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
      await entries.value.cancel();
    }
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
