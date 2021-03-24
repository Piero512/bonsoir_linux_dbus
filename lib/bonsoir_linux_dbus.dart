library bonsoir_linux_dbus;

import 'package:bonsoir_linux_dbus/src/linux_dbus_bonsoir_discovery.dart';
import 'package:bonsoir_linux_dbus/src/linux_dbus_bonsoir_broadcast.dart';
import 'package:bonsoir_platform_interface/bonsoir_platform_interface.dart';

import 'package:flutter/foundation.dart';

/// Class for Linux implementation through Bonjour interface.
class BonsoirLinuxDBus extends BonsoirPlatformInterface {

  static void registerWith(){
    BonsoirPlatformInterface.instance = BonsoirLinuxDBus();
  }

  @override
  BonsoirAction<BonsoirBroadcastEvent> createBroadcast(service,
      {bool printLogs = kDebugMode}) {
    return LinuxDBusBonsoirBroadcast(service, printLogs);
  }

  @override
  BonsoirAction<BonsoirDiscoveryEvent> createDiscovery(String type,
      {bool printLogs = kDebugMode}) {
    return LinuxDBusBonsoirDiscovery(type, printLogs);
  }
}
