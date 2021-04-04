// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.ItemNew.
class AvahiServiceBrowserItemNew extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiServiceBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.ItemRemove.
class AvahiServiceBrowserItemRemove extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  int get flags => (values[5] as DBusUint32).value;

  AvahiServiceBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.Failure.
class AvahiServiceBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiServiceBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.AllForNow.
class AvahiServiceBrowserAllForNow extends DBusSignal {
  AvahiServiceBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceBrowser.CacheExhausted.
class AvahiServiceBrowserCacheExhausted extends DBusSignal {
  AvahiServiceBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
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
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.DBus.Introspectable.Introspect returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.ServiceBrowser.Free()
  Future<void> callFree() async {
    var result =
        await callMethod('org.freedesktop.Avahi.ServiceBrowser', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceBrowser.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.ServiceBrowser.Start()
  Future<void> callStart() async {
    var result = await callMethod('org.freedesktop.Avahi.ServiceBrowser', 'Start', [], flags: {DBusMethodCallFlag.noReplyExpected});
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceBrowser.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.ItemNew.
  Stream<AvahiServiceBrowserItemNew> subscribeItemNew() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'ItemNew');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisssu')) {
        return AvahiServiceBrowserItemNew(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceBrowser.ItemNew contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.ItemRemove.
  Stream<AvahiServiceBrowserItemRemove> subscribeItemRemove() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'ItemRemove');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisssu')) {
        return AvahiServiceBrowserItemRemove(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceBrowser.ItemRemove contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.Failure.
  Stream<AvahiServiceBrowserFailure> subscribeFailure() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiServiceBrowserFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceBrowser.Failure contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.AllForNow.
  Stream<AvahiServiceBrowserAllForNow> subscribeAllForNow() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceBrowser', 'AllForNow');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiServiceBrowserAllForNow(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceBrowser.AllForNow contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceBrowser.CacheExhausted.
  Stream<AvahiServiceBrowserCacheExhausted> subscribeCacheExhausted() {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.ServiceBrowser', 'CacheExhausted');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiServiceBrowserCacheExhausted(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceBrowser.CacheExhausted contains invalid values \${signal.values}';
      }
    });
  }
}
