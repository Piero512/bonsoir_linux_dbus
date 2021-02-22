import 'linux_dbus_bonsoir_events.dart';
import 'package:bonsoir/bonsoir.dart';
import 'dart:async';
import 'avahi_defs/entry_group.dart';
import 'package:dbus/dbus.dart';
import 'avahi_defs/constants.dart';
import 'dart:convert' as conv;

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
      entries.value.cancel();
    }
    await _entryGroup.callFree();
    _controller.add(BonsoirBroadcastEvent(
        type: BonsoirBroadcastEventType.BROADCAST_STOPPED));
    _isStopped = true;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': _entryGroup?.path.toString() ?? "UNKNOWN",
      'printLogs': _printLogs
    };
  }
}
