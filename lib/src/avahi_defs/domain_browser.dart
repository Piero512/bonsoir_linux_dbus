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
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.ItemRemove.
class AvahiDomainBrowserItemRemove extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get domain => (values[2] as DBusString).value;
  int get flags => (values[3] as DBusUint32).value;

  AvahiDomainBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.Failure.
class AvahiDomainBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiDomainBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.AllForNow.
class AvahiDomainBrowserAllForNow extends DBusSignal {
  AvahiDomainBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.DomainBrowser.CacheExhausted.
class AvahiDomainBrowserCacheExhausted extends DBusSignal {
  AvahiDomainBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiDomainBrowser extends DBusRemoteObject {
  /// Stream of org.freedesktop.Avahi.DomainBrowser.ItemNew signals.
  late final Stream<AvahiDomainBrowserItemNew> itemNew;

  /// Stream of org.freedesktop.Avahi.DomainBrowser.ItemRemove signals.
  late final Stream<AvahiDomainBrowserItemRemove> itemRemove;

  /// Stream of org.freedesktop.Avahi.DomainBrowser.Failure signals.
  late final Stream<AvahiDomainBrowserFailure> failure;

  /// Stream of org.freedesktop.Avahi.DomainBrowser.AllForNow signals.
  late final Stream<AvahiDomainBrowserAllForNow> allForNow;

  /// Stream of org.freedesktop.Avahi.DomainBrowser.CacheExhausted signals.
  late final Stream<AvahiDomainBrowserCacheExhausted> cacheExhausted;

  AvahiDomainBrowser(DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path) {
    itemNew = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.DomainBrowser', 'ItemNew',
            signature: DBusSignature('iisu'))
        .map((signal) => AvahiDomainBrowserItemNew(signal));

    itemRemove = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.DomainBrowser', 'ItemRemove',
            signature: DBusSignature('iisu'))
        .map((signal) => AvahiDomainBrowserItemRemove(signal));

    failure = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.DomainBrowser', 'Failure',
            signature: DBusSignature('s'))
        .map((signal) => AvahiDomainBrowserFailure(signal));

    allForNow = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.DomainBrowser', 'AllForNow',
            signature: DBusSignature(''))
        .map((signal) => AvahiDomainBrowserAllForNow(signal));

    cacheExhausted = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.DomainBrowser', 'CacheExhausted',
            signature: DBusSignature(''))
        .map((signal) => AvahiDomainBrowserCacheExhausted(signal));
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

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Free()
  Future<void> callFree(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Free', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.Avahi.DomainBrowser.Start()
  Future<void> callStart(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.DomainBrowser', 'Start', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
