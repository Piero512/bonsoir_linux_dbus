// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.ItemNew.
class AvahiServiceBrowserItemNew extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiServiceBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.ItemRemove.
class AvahiServiceBrowserItemRemove extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiServiceBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.Failure.
class AvahiServiceBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiServiceBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.AllForNow.
class AvahiServiceBrowserAllForNow extends DBusSignal {
  AvahiServiceBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.CacheExhausted.
class AvahiServiceBrowserCacheExhausted extends DBusSignal {
  AvahiServiceBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiServiceBrowser extends DBusRemoteObject {
  AvahiServiceBrowser(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.ServiceBrowser.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.ServiceBrowser', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.ServiceBrowser.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.ServiceBrowser', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.ItemNew.
  Stream<AvahiServiceBrowserItemNew> subscribeItemNew() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'ItemNew');
    await for (var signal in signals) {
      if (signal.values.length == 6 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('s') &&
          signal.values[4].signature == DBusSignature('s') &&
          signal.values[5].signature == DBusSignature('u')) {
        yield AvahiServiceBrowserItemNew(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.ItemRemove.
  Stream<AvahiServiceBrowserItemRemove> subscribeItemRemove() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'ItemRemove');
    await for (var signal in signals) {
      if (signal.values.length == 6 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('s') &&
          signal.values[4].signature == DBusSignature('s') &&
          signal.values[5].signature == DBusSignature('u')) {
        yield AvahiServiceBrowserItemRemove(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.Failure.
  Stream<AvahiServiceBrowserFailure> subscribeFailure() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 &&
          signal.values[0].signature == DBusSignature('s')) {
        yield AvahiServiceBrowserFailure(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.AllForNow.
  Stream<AvahiServiceBrowserAllForNow> subscribeAllForNow() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'AllForNow');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiServiceBrowserAllForNow(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.CacheExhausted.
  Stream<AvahiServiceBrowserCacheExhausted> subscribeCacheExhausted() async* {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.ServiceBrowser', 'CacheExhausted');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiServiceBrowserCacheExhausted(signal);
      }
    }
  }
}
