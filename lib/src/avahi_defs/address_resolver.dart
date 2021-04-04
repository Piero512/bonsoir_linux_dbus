// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.AddressResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.AddressResolver.Found.
class AvahiAddressResolverFound extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  int get aprotocol => (values[2] as DBusInt32).value;
  String get address => (values[3] as DBusString).value;
  String get name => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiAddressResolverFound(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.AddressResolver.Failure.
class AvahiAddressResolverFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiAddressResolverFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiAddressResolver extends DBusRemoteObject {
  AvahiAddressResolver(
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

  /// Invokes org.freedesktop.Avahi.AddressResolver.Free()
  Future<void> callFree() async {
    var result =
        await callMethod('org.freedesktop.Avahi.AddressResolver', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.AddressResolver.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.AddressResolver.Start()
  Future<void> callStart() async {
    var result =
        await callMethod('org.freedesktop.Avahi.AddressResolver', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.AddressResolver.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.AddressResolver.Found.
  Stream<AvahiAddressResolverFound> subscribeFound() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.AddressResolver', 'Found');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iiissu')) {
        return AvahiAddressResolverFound(signal);
      } else {
        throw 'org.freedesktop.Avahi.AddressResolver.Found contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.AddressResolver.Failure.
  Stream<AvahiAddressResolverFailure> subscribeFailure() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.AddressResolver', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiAddressResolverFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.AddressResolver.Failure contains invalid values \${signal.values}';
      }
    });
  }
}
