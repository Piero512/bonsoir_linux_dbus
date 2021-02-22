// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.HostNameResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Found.
class OrgFreedesktopDBusIntrospectableFound extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get aprotocol => (values[3] as DBusInt32).value;
  String get address => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  OrgFreedesktopDBusIntrospectableFound(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Failure.
class OrgFreedesktopDBusIntrospectableFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  OrgFreedesktopDBusIntrospectableFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class OrgFreedesktopDBusIntrospectable extends DBusRemoteObject {
  OrgFreedesktopDBusIntrospectable(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('null')})
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.HostNameResolver.Found.
  Stream<OrgFreedesktopDBusIntrospectableFound> subscribeFound() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.HostNameResolver', 'Found');
    await for (var signal in signals) {
      if (signal.values.length == 6 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('i') &&
          signal.values[4].signature == DBusSignature('s') &&
          signal.values[5].signature == DBusSignature('u')) {
        yield OrgFreedesktopDBusIntrospectableFound(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.HostNameResolver.Failure.
  Stream<OrgFreedesktopDBusIntrospectableFailure> subscribeFailure() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.HostNameResolver', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 &&
          signal.values[0].signature == DBusSignature('s')) {
        yield OrgFreedesktopDBusIntrospectableFailure(signal);
      }
    }
  }
}
