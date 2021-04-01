// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.DomainBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.DomainBrowser.ItemNew.
class AvahiDomainBrowserItemNew extends DBusSignal{
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get domain => (values[2] as DBusString).value;
  int get flags => (values[3] as DBusUint32).value;

  AvahiDomainBrowserItemNew(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.ItemRemove.
class AvahiDomainBrowserItemRemove extends DBusSignal{
  int get interface_ => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get domain => (values[2] as DBusString).value;
  int get flags => (values[3] as DBusUint32).value;

  AvahiDomainBrowserItemRemove(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.Failure.
class AvahiDomainBrowserFailure extends DBusSignal{
  String get error => (values[0] as DBusString).value;

  AvahiDomainBrowserFailure(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.AllForNow.
class AvahiDomainBrowserAllForNow extends DBusSignal{

  AvahiDomainBrowserAllForNow(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.CacheExhausted.
class AvahiDomainBrowserCacheExhausted extends DBusSignal{

  AvahiDomainBrowserCacheExhausted(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.name, signal.values);
}

class AvahiDomainBrowser extends DBusRemoteObject {
  AvahiDomainBrowser(DBusClient client, String destination, DBusObjectPath path) : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod('org.freedesktop.DBus.Introspectable', 'Introspect', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.DBus.Introspectable.Introspect returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Free()
  Future<void> callFree() async {
    var result = await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.DomainBrowser.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Start()
  Future<void> callStart() async {
    var result = await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.DomainBrowser.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.ItemNew.
  Stream<AvahiDomainBrowserItemNew> subscribeItemNew() {
    var signals = subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'ItemNew');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisu')) {
        return AvahiDomainBrowserItemNew(signal);
      } else {
        throw 'org.freedesktop.Avahi.DomainBrowser.ItemNew contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.ItemRemove.
  Stream<AvahiDomainBrowserItemRemove> subscribeItemRemove() {
    var signals = subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'ItemRemove');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisu')) {
        return AvahiDomainBrowserItemRemove(signal);
      } else {
        throw 'org.freedesktop.Avahi.DomainBrowser.ItemRemove contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.Failure.
  Stream<AvahiDomainBrowserFailure> subscribeFailure() {
    var signals = subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiDomainBrowserFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.DomainBrowser.Failure contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.AllForNow.
  Stream<AvahiDomainBrowserAllForNow> subscribeAllForNow() {
    var signals = subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'AllForNow');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiDomainBrowserAllForNow(signal);
      } else {
        throw 'org.freedesktop.Avahi.DomainBrowser.AllForNow contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.CacheExhausted.
  Stream<AvahiDomainBrowserCacheExhausted> subscribeCacheExhausted() {
    var signals = subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'CacheExhausted');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiDomainBrowserCacheExhausted(signal);
      } else {
        throw 'org.freedesktop.Avahi.DomainBrowser.CacheExhausted contains invalid values \${signal.values}';
      }
    });
  }
}
