// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceTypeBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew.
class AvahiServiceTypeBrowserItemNew extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get type => (values[2] as DBusString).value;
  String get domain => (values[3] as DBusString).value;
  int get flags => (values[4] as DBusUint32).value;

  AvahiServiceTypeBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove.
class AvahiServiceTypeBrowserItemRemove extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get type => (values[2] as DBusString).value;
  String get domain => (values[3] as DBusString).value;
  int get flags => (values[4] as DBusUint32).value;

  AvahiServiceTypeBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.Failure.
class AvahiServiceTypeBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiServiceTypeBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow.
class AvahiServiceTypeBrowserAllForNow extends DBusSignal {
  AvahiServiceTypeBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted.
class AvahiServiceTypeBrowserCacheExhausted extends DBusSignal {
  AvahiServiceTypeBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiServiceTypeBrowser extends DBusRemoteObject {
  AvahiServiceTypeBrowser(
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

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Free()
  Future<void> callFree() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.ServiceTypeBrowser', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceTypeBrowser.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Start()
  Future<void> callStart() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.ServiceTypeBrowser', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.ServiceTypeBrowser.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew.
  Stream<AvahiServiceTypeBrowserItemNew> subscribeItemNew() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemNew');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iissu')) {
        return AvahiServiceTypeBrowserItemNew(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove.
  Stream<AvahiServiceTypeBrowserItemRemove> subscribeItemRemove() {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemRemove');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iissu')) {
        return AvahiServiceTypeBrowserItemRemove(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.Failure.
  Stream<AvahiServiceTypeBrowserFailure> subscribeFailure() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiServiceTypeBrowserFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceTypeBrowser.Failure contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow.
  Stream<AvahiServiceTypeBrowserAllForNow> subscribeAllForNow() {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.ServiceTypeBrowser', 'AllForNow');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiServiceTypeBrowserAllForNow(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted.
  Stream<AvahiServiceTypeBrowserCacheExhausted> subscribeCacheExhausted() {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.ServiceTypeBrowser', 'CacheExhausted');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiServiceTypeBrowserCacheExhausted(signal);
      } else {
        throw 'org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted contains invalid values \${signal.values}';
      }
    });
  }
}
