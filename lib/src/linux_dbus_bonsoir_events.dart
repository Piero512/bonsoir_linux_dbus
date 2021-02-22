import 'dart:async';
import 'dart:developer';

import 'package:bonsoir_linux_dbus/src/avahi_defs/entry_group.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/service_browser.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/constants.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/service_resolver.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'package:dbus/dbus.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/server.dart';
import 'dart:convert' as conv;
import 'package:bonsoir/bonsoir.dart';

extension LinuxAvahi on BonsoirService {
  BonsoirService copyWith(
          {String name,
          String type,
          int port,
          Map<String, dynamic> attributes}) =>
      BonsoirService(
        name: name ?? this.name,
        type: type ?? this.type,
        port: port ?? this.port,
        attributes: attributes ?? this.attributes,
      );
}

extension BonsoirStaticClasses on BonsoirBroadcastEvent {
  static BonsoirBroadcastEvent get unknownEvent =>
      BonsoirBroadcastEvent(type: BonsoirBroadcastEventType.UNKNOWN);
}

abstract class LinuxDBusBonsoirEvents<T> extends BonsoirPlatformEvents<T> {
  DBusClient busClient = DBusClient.system();
  AvahiServer server;

  LinuxDBusBonsoirEvents() {
    server = AvahiServer(busClient, 'org.freedesktop.Avahi',
        path: DBusObjectPath('/'));
  }
}

class LinuxDBusBonsoirBroadcast
    extends LinuxDBusBonsoirEvents<BonsoirBroadcastEvent> {
  final BonsoirService service;
  StreamController<BonsoirBroadcastEvent> _controller;
  bool _isStopped = false;
  final bool _printLogs;

  LinuxDBusBonsoirBroadcast(this.service, this._printLogs);

  AvahiEntryGroup _entryGroup;

  Map<String, StreamSubscription> _subscriptions = {};

  @override
  Stream<BonsoirBroadcastEvent> get eventStream => _controller?.stream;

  @override
  bool get isReady => _controller != null && !_isStopped;

  @override
  bool get isStopped => _isStopped;

  @override
  Future<void> get ready async {
    _entryGroup = AvahiEntryGroup(
      busClient,
      'org.freedesktop.Avahi',
      path: DBusObjectPath(
        await server.callEntryGroupNew(),
      ),
    );
    await sendServiceToAvahi(this.service);
  }

  @override
  Future<void> start() async {
    _controller = StreamController.broadcast();
    _subscriptions['StateChanged'] =
        _entryGroup.subscribeStateChanged().listen((event) {
      switch (event.state.toAvahiEntryGroupState()) {
        case AvahiEntryGroupState.AVAHI_ENTRY_GROUP_UNCOMMITED:
        case AvahiEntryGroupState.AVAHI_ENTRY_GROUP_REGISTERING:
          // TODO: Separate the events
          _controller.add(BonsoirStaticClasses.unknownEvent);
          break;
        case AvahiEntryGroupState.AVAHI_ENTRY_GROUP_ESTABLISHED:
          _controller.add(BonsoirBroadcastEvent(
              type: BonsoirBroadcastEventType.BROADCAST_STARTED,
              service: service));
          break;
        case AvahiEntryGroupState.AVAHI_ENTRY_GROUP_COLLISION:
          print("Service name collision!");
          _controller.add(BonsoirStaticClasses.unknownEvent);
          server.callGetAlternativeServiceName(service.name).then(
                (newName) => _entryGroup.callReset().then(
                      (_) => sendServiceToAvahi(
                        service.copyWith(name: newName),
                      ),
                    ),
              );
          break;
        case AvahiEntryGroupState.AVAHI_ENTRY_GROUP_FAILURE:
          print("Received failure: ${event.error}");
          _controller.add(BonsoirStaticClasses.unknownEvent);
          break;
      }
    });
    await _entryGroup.callCommit();
  }

  Future<void> sendServiceToAvahi(BonsoirService svc) {
    return _entryGroup.callAddService(
        AvahiIfIndexUnspecified,
        AvahiProtocolUnspecified,
        0,
        svc.name,
        svc.type,
        '',
        '',
        svc.port,
        service.attributes != null
            ? service.attributes.entries
                .map(
                  (e) => "${e.key}=${e.value}",
                )
                .map(
                  (str) => conv.utf8.encode(str),
                )
                .toList()
            : []);
  }

  @override
  Future<void> stop() async {
    for (var entries in _subscriptions.entries) {
      await entries.value.cancel();
    }
    await _entryGroup.callFree();
    _controller.add(BonsoirBroadcastEvent(
        type: BonsoirBroadcastEventType.BROADCAST_STOPPED));
    _controller.close();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': _entryGroup?.path.toString() ?? "UNKNOWN",
      'printLogs': _printLogs
    };
  }
}

class LinuxDBusBonsoirDiscovery
    extends LinuxDBusBonsoirEvents<BonsoirDiscoveryEvent> {
  final String type;
  StreamController<BonsoirDiscoveryEvent> _controller;
  bool _isStopped = false;
  final bool _printLogs;
  AvahiServiceBrowser _browser;
  Map<String, StreamSubscription> _subscriptions = {};
  Map<String, AvahiServiceResolver> pendingSolvers = {};

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
    await _browser.callStart();
    _controller = StreamController.broadcast();
    _controller.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STARTED));
    _subscriptions['ItemNew'] =
        _browser.subscribeItemNew().listen((event) async {
      print("Item added! $event");
      await sendServiceToResolver(event);
      _controller.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_FOUND,
          service:
              BonsoirService(name: event.name, type: event.type, port: null),
        ),
      );
    });
    _subscriptions['ItemRm'] = _browser.subscribeItemRemove().listen((event) {
      print("Item removed! $event");
      _controller.add(
        BonsoirDiscoveryEvent(
          type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST,
          service: BonsoirService(
              name: event.name, type: event.type, port: null, attributes: {}),
        ),
      );
      _subscriptions['${event.name}-resolve'].cancel();
    });
  }

  sendServiceToResolver(AvahiServiceBrowserItemNew newService) async {
    if (pendingSolvers.containsKey(newService.name)) {
      debugger();
    } else {
      var resolver = AvahiServiceResolver(
        busClient,
        'org.freedesktop.Avahi',
        path: DBusObjectPath(
          await server.callServiceResolverNew(
              newService.interfaceValue,
              newService.protocol,
              newService.name,
              newService.type,
              newService.domain,
              AvahiProtocolUnspecified,
              0),
        ),
      );
      _subscriptions['${newService.name}-resolve'] =
          resolver.subscribeFound().listen((event) {
        _controller.add(
          BonsoirDiscoveryEvent(
            type: BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED,
            service: ResolvedBonsoirService(
              name: event.name,
              type: event.type,
              port: event.port,
              ip: event.address,
              attributes: Map.fromEntries(event.txt
                  .map((rawData) => conv.utf8.decode(rawData))
                  .map((e) => MapEntry(e.split("=").first, e.split("=").last))),
            ),
          ),
        );
      });
    }
  }

  @override
  Future<void> stop() async {
    for (var entries in _subscriptions.entries) {
      await entries.value.cancel();
    }
    _controller.add(BonsoirDiscoveryEvent(
        type: BonsoirDiscoveryEventType.DISCOVERY_STOPPED));
    _controller.close();
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
