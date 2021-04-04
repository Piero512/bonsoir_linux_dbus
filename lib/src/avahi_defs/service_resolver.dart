// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceResolver.Found.
class AvahiServiceResolverFound extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  String get host => (values[5] as DBusString).value;
  int get aprotocol => (values[6] as DBusInt32).value;
  String get address => (values[7] as DBusString).value;
  int get port => (values[8] as DBusUint16).value;
  List<List<int>> get txt => (values[9] as DBusArray)
      .children
      .map((child) => (child as DBusArray)
          .children
          .map((child) => (child as DBusByte).value)
          .toList())
      .toList();
  int get flags => (values[10] as DBusUint32).value;

  AvahiServiceResolverFound(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceResolver.Failure.
class AvahiServiceResolverFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiServiceResolverFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiServiceResolver extends DBusRemoteObject {
  AvahiServiceResolver(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.DBus.Introspectable.Introspect returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.ServiceResolver.Free()
  Future<void> callFree() async {
    var result =
        await callMethod('org.freedesktop.Avahi.ServiceResolver', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceResolver.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.ServiceResolver.Start()
  Future<void> callStart() async {
    var result =
        await callMethod('org.freedesktop.Avahi.ServiceResolver', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceResolver.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceResolver.Found.
  Stream<AvahiServiceResolverFound> subscribeFound() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceResolver', 'Found');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iissssisqaayu')) {
        return AvahiServiceResolverFound(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceResolver.Found contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceResolver.Failure.
  Stream<AvahiServiceResolverFailure> subscribeFailure() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceResolver', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiServiceResolverFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceResolver.Failure contains invalid values \${signal.values}';
      }
    });
  }
}
