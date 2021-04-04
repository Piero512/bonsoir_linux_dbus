import 'dart:async';

import 'package:bonsoir_linux_dbus/src/avahi_defs/server.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/service_browser.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'avahi_defs/constants.dart';
import 'package:dbus/dbus.dart';
import 'dart:convert' as conv;
import 'package:meta/meta.dart';

extension LinuxAvahi on BonsoirService {
  BonsoirService copyWith(
          {String? name,
          String? type,
          int? port,
          Map<String, dynamic>? attributes}) =>
      BonsoirService(
        name: name ?? this.name,
        type: type ?? this.type,
        port: port ?? this.port,
        attributes: attributes as Map<String, String>? ?? this.attributes,
      );
}

extension BonsoirStaticClasses on BonsoirBroadcastEvent {
  static BonsoirBroadcastEvent get unknownEvent =>
      BonsoirBroadcastEvent(type: BonsoirBroadcastEventType.UNKNOWN);
}

extension ItemNewPrintHelpers on AvahiServiceBrowserItemNew {
  String get friendlyString {
    return "AvahiServiceBrowserItemNew(path: '$path',interface: '$interface_',protocol: '${protocol.toAvahiProtocol().toString()}', name: '$name',type: '$type',domain: '${this.domain}'";
  }
}

extension ItemRemovePrintHelpers on AvahiServiceBrowserItemRemove {
  String get friendlyString {
    return "AvahiServiceBrowserItemRemove(path: '$path',interface: '$interface_',protocol: '${protocol.toAvahiProtocol().toString()}', name: '$name',type: '$type',domain: '${this.domain}'";
  }
}

abstract class LinuxDBusBonsoirEvents<T extends BonsoirEvent>
    extends BonsoirAction<T> {
  DBusClient busClient = DBusClient.system();
  late AvahiServer server;
  final bool printLogs;
  bool _isStopped = false;
  StreamController<T>? controller;
  @override
  Stream<T>? get eventStream => controller?.stream;

  LinuxDBusBonsoirEvents(this.printLogs) {
    server =
        AvahiServer(busClient, 'org.freedesktop.Avahi', DBusObjectPath('/'));
  }

  @override
  bool get isReady => controller != null && !isStopped;

  @override
  bool get isStopped => _isStopped;

  static List<List<int>> convertAttributesToTxtRecord(
      Map<String, String> attributes) {
    return attributes.entries
        .map(
          (e) => "${e.key}=${e.value}",
        )
        .map(
          (str) => conv.utf8.encode(str),
        )
        .toList();
  }

  @override
  @mustCallSuper
  Future<void> stop() async {
    controller?.close();
    _isStopped = true;
  }

  void dbgPrint(dynamic toPrint) {
    if (printLogs) {
      print(toPrint);
    }
  }
}
