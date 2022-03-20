library bonsoir_linux_dbus;

import 'package:bonsoir_linux_dbus/src/broadcast.dart';
import 'package:bonsoir_linux_dbus/src/discovery.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/foundation.dart';

import 'src/avahi_defs/server.dart';

typedef DiscoveryFactory = AvahiBonsoirDiscovery Function(String, bool);

/// Class for Linux implementation through Bonjour interface.
class AvahiBonsoir extends BonsoirPlatformInterface {
  DiscoveryFactory _discoveryFactory =
      (String type, bool printLogs) => LegacyClient(type, printLogs);

  static void registerWith() {
    var impl = AvahiBonsoir();
    impl.pickDiscoveryFactory();
    BonsoirPlatformInterface.instance = impl;
  }

  static Future<bool> isModernAvahi() async {
    var server = AvahiServer(
        DBusClient.system(), 'org.freedesktop.Avahi', DBusObjectPath('/'));
    var version = (await server.callGetVersionString()).split(" ").last;
    var mayor = int.parse(version.split(".").first);
    var minor = int.parse(version.split(".").last);
    return mayor > 7 && minor >= 0;
  }

  @visibleForTesting
  Future<void> pickDiscoveryFactory() {
    return isModernAvahi().then((value) {
      if (value)
        this._discoveryFactory =
            (String type, bool printLogs) => V2Client(type, printLogs);
    });
  }

  @override
  BonsoirAction<BonsoirBroadcastEvent> createBroadcast(service,
      {bool printLogs = kDebugMode}) {
    return AvahiBonsoirBroadcast(service, printLogs);
  }

  @override
  BonsoirAction<BonsoirDiscoveryEvent> createDiscovery(String type,
      {bool printLogs = kDebugMode}) {
    return _discoveryFactory(type, printLogs);
  }
}
