// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.HostNameResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Found.
class AvahiHostNameResolverFound extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get hostName => (values[2] as DBusString).value;
  int get aprotocol => (values[3] as DBusInt32).value;
  String get address => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiHostNameResolverFound(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.HostNameResolver.Failure.
class AvahiHostNameResolverFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiHostNameResolverFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiHostNameResolver extends DBusRemoteObject {
  /// Stream of org.freedesktop.Avahi.HostNameResolver.Found signals.
  late final Stream<AvahiHostNameResolverFound> found;

  /// Stream of org.freedesktop.Avahi.HostNameResolver.Failure signals.
  late final Stream<AvahiHostNameResolverFailure> failure;

  AvahiHostNameResolver(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path) {
    found = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.HostNameResolver', 'Found',
            signature: DBusSignature('iisisu'))
        .map((signal) => AvahiHostNameResolverFound(signal));

    failure = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.HostNameResolver', 'Failure',
            signature: DBusSignature('s'))
        .map((signal) => AvahiHostNameResolverFailure(signal));
  }

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', [],
        replySignature: DBusSignature('s'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Free()
  Future<void> callFree(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Free', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.Avahi.HostNameResolver.Start()
  Future<void> callStart(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.HostNameResolver', 'Start', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
