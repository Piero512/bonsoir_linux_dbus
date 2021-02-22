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
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceResolver.Failure.
class AvahiServiceResolverFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiServiceResolverFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiServiceResolver extends DBusRemoteObject {
  AvahiServiceResolver(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('null')})
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.ServiceResolver.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.ServiceResolver', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.ServiceResolver.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.ServiceResolver', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceResolver.Found.
  Stream<AvahiServiceResolverFound> subscribeFound() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceResolver', 'Found');
    await for (var signal in signals) {
      if (signal.values.length == 11 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('s') &&
          signal.values[4].signature == DBusSignature('s') &&
          signal.values[5].signature == DBusSignature('s') &&
          signal.values[6].signature == DBusSignature('i') &&
          signal.values[7].signature == DBusSignature('s') &&
          signal.values[8].signature == DBusSignature('q') &&
          signal.values[9].signature == DBusSignature('aay') &&
          signal.values[10].signature == DBusSignature('u')) {
        yield AvahiServiceResolverFound(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceResolver.Failure.
  Stream<AvahiServiceResolverFailure> subscribeFailure() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceResolver', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 &&
          signal.values[0].signature == DBusSignature('s')) {
        yield AvahiServiceResolverFailure(signal);
      }
    }
  }
}
