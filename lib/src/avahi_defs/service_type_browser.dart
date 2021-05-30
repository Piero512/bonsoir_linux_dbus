// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceTypeBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew.
class AvahiServiceTypeBrowserItemNew extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
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
  int get interfaceValue => (values[0] as DBusInt32).value;
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
  /// Stream of org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew signals.
  late final Stream<AvahiServiceTypeBrowserItemNew> itemNew;

  /// Stream of org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove signals.
  late final Stream<AvahiServiceTypeBrowserItemRemove> itemRemove;

  /// Stream of org.freedesktop.Avahi.ServiceTypeBrowser.Failure signals.
  late final Stream<AvahiServiceTypeBrowserFailure> failure;

  /// Stream of org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow signals.
  late final Stream<AvahiServiceTypeBrowserAllForNow> allForNow;

  /// Stream of org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted signals.
  late final Stream<AvahiServiceTypeBrowserCacheExhausted> cacheExhausted;

  AvahiServiceTypeBrowser(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path) {
    itemNew = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemNew',
            signature: DBusSignature('iissu'))
        .map((signal) => AvahiServiceTypeBrowserItemNew(signal));

    itemRemove = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemRemove',
            signature: DBusSignature('iissu'))
        .map((signal) => AvahiServiceTypeBrowserItemRemove(signal));

    failure = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.ServiceTypeBrowser', 'Failure',
            signature: DBusSignature('s'))
        .map((signal) => AvahiServiceTypeBrowserFailure(signal));

    allForNow = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.ServiceTypeBrowser', 'AllForNow',
            signature: DBusSignature(''))
        .map((signal) => AvahiServiceTypeBrowserAllForNow(signal));

    cacheExhausted = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.ServiceTypeBrowser', 'CacheExhausted',
            signature: DBusSignature(''))
        .map((signal) => AvahiServiceTypeBrowserCacheExhausted(signal));
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

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Free()
  Future<void> callFree(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.ServiceTypeBrowser', 'Free', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Start()
  Future<void> callStart(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.ServiceTypeBrowser', 'Start', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
