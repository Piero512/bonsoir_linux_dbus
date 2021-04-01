// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.HostNameResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Found.
class AvahiHostNameResolverFound extends DBusSignal{
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get aprotocol => (values[3] as DBusInt32).value;
  String get address => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiHostNameResolverFound(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Failure.
class AvahiHostNameResolverFailure extends DBusSignal{
  String get error => (values[0] as DBusString).value;

  AvahiHostNameResolverFailure(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

class AvahiHostNameResolver extends DBusRemoteObject {
  AvahiHostNameResolver(DBusClient client, String destination, DBusObjectPath path) : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod('org.freedesktop.DBus.Introspectable', 'Introspect', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.DBus.Introspectable.Introspect returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Free()
  Future<void> callFree() async {
    var result = await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.HostNameResolver.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Start()
  Future<void> callStart() async {
    var result = await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.HostNameResolver.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.HostNameResolver.Found.
  Stream<AvahiHostNameResolverFound> subscribeFound() {
    var signals = subscribeSignal('org.freedesktop.Avahi.HostNameResolver', 'Found');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisisu')) {
        return AvahiHostNameResolverFound(signal);
      } else {
        throw 'org.freedesktop.Avahi.HostNameResolver.Found contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.HostNameResolver.Failure.
  Stream<AvahiHostNameResolverFailure> subscribeFailure() {
    var signals = subscribeSignal('org.freedesktop.Avahi.HostNameResolver', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiHostNameResolverFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.HostNameResolver.Failure contains invalid values \${signal.values}';
      }
    });
  }
}
