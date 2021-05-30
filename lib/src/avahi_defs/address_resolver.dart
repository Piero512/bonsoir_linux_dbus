// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.AddressResolver.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.AddressResolver.Found.
class AvahiAddressResolverFound extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  int get aprotocol => (values[2] as DBusInt32).value;
  String get address => (values[3] as DBusString).value;
  String get serviceName => (values[4] as DBusString).value;
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
  /// Stream of org.freedesktop.Avahi.AddressResolver.Found signals.
  late final Stream<AvahiAddressResolverFound> found;

  /// Stream of org.freedesktop.Avahi.AddressResolver.Failure signals.
  late final Stream<AvahiAddressResolverFailure> failure;

  AvahiAddressResolver(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path) {
    found = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.AddressResolver', 'Found',
            signature: DBusSignature('iiissu'))
        .map((signal) => AvahiAddressResolverFound(signal));

    failure = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.AddressResolver', 'Failure',
            signature: DBusSignature('s'))
        .map((signal) => AvahiAddressResolverFailure(signal));
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

  /// Invokes org.freedesktop.Avahi.AddressResolver.Free()
  Future<void> callFree(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.AddressResolver', 'Free', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.Avahi.AddressResolver.Start()
  Future<void> callStart(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.AddressResolver', 'Start', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
