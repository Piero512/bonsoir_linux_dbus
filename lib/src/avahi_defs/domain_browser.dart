// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.DomainBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.DomainBrowser.ItemNew.
class AvahiDomainBrowserItemNew extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get domain => (values[2] as DBusString).value;
  int get flags => (values[3] as DBusUint32).value;

  AvahiDomainBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.ItemRemove.
class AvahiDomainBrowserItemRemove extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get domain => (values[2] as DBusString).value;
  int get flags => (values[3] as DBusUint32).value;

  AvahiDomainBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.Failure.
class AvahiDomainBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiDomainBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.AllForNow.
class AvahiDomainBrowserAllForNow extends DBusSignal {
  AvahiDomainBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.CacheExhausted.
class AvahiDomainBrowserCacheExhausted extends DBusSignal {
  AvahiDomainBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiDomainBrowser extends DBusRemoteObject {
  AvahiDomainBrowser(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('null')})
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.ItemNew.
  Stream<AvahiDomainBrowserItemNew> subscribeItemNew() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'ItemNew');
    await for (var signal in signals) {
      if (signal.values.length == 4 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('u')) {
        yield AvahiDomainBrowserItemNew(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.ItemRemove.
  Stream<AvahiDomainBrowserItemRemove> subscribeItemRemove() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'ItemRemove');
    await for (var signal in signals) {
      if (signal.values.length == 4 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('u')) {
        yield AvahiDomainBrowserItemRemove(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.Failure.
  Stream<AvahiDomainBrowserFailure> subscribeFailure() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 &&
          signal.values[0].signature == DBusSignature('s')) {
        yield AvahiDomainBrowserFailure(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.AllForNow.
  Stream<AvahiDomainBrowserAllForNow> subscribeAllForNow() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.DomainBrowser', 'AllForNow');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiDomainBrowserAllForNow(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.DomainBrowser.CacheExhausted.
  Stream<AvahiDomainBrowserCacheExhausted> subscribeCacheExhausted() async* {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.DomainBrowser', 'CacheExhausted');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiDomainBrowserCacheExhausted(signal);
      }
    }
  }
}
