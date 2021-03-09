import 'package:bonsoir_linux_dbus/src/avahi_defs/server.dart';
import 'package:bonsoir_linux_dbus/src/avahi_defs/service_browser.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'package:bonsoir_platform_interface/service/service.dart';
import 'package:bonsoir_platform_interface/events/broadcast_event.dart';
import 'avahi_defs/constants.dart';
import 'package:dbus/dbus.dart';
import 'dart:convert' as conv;

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
    return "AvahiServiceBrowserItemNew(path: '$path',interface: '$interfaceValue',protocol: '${protocol.toAvahiProtocol().toString()}', name: '$name',type: '$type',domain: '${this.domain}'";
  }
}

extension ItemRemovePrintHelpers on AvahiServiceBrowserItemRemove {
  String get friendlyString {
    return "AvahiServiceBrowserItemRemove(path: '$path',interface: '$interfaceValue',protocol: '${protocol.toAvahiProtocol().toString()}', name: '$name',type: '$type',domain: '${this.domain}'";
  }
}

abstract class LinuxDBusBonsoirEvents<T> extends BonsoirPlatformEvents<T> {
  DBusClient busClient = DBusClient.system();
  late AvahiServer server;

  LinuxDBusBonsoirEvents() {
    server = AvahiServer(busClient, 'org.freedesktop.Avahi',
        DBusObjectPath('/'));
  }

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
}
