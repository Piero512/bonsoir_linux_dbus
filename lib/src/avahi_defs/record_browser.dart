// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.RecordBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemNew.
class AvahiRecordBrowserItemNew extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get recordName => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray)
      .children
      .map((child) => (child as DBusByte).value)
      .toList();
  int get flags => (values[6] as DBusUint32).value;

  AvahiRecordBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemRemove.
class AvahiRecordBrowserItemRemove extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get recordName => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray)
      .children
      .map((child) => (child as DBusByte).value)
      .toList();
  int get flags => (values[6] as DBusUint32).value;

  AvahiRecordBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.Failure.
class AvahiRecordBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiRecordBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.AllForNow.
class AvahiRecordBrowserAllForNow extends DBusSignal {
  AvahiRecordBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
class AvahiRecordBrowserCacheExhausted extends DBusSignal {
  AvahiRecordBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiRecordBrowser extends DBusRemoteObject {
  /// Stream of org.freedesktop.Avahi.RecordBrowser.ItemNew signals.
  late final Stream<AvahiRecordBrowserItemNew> itemNew;

  /// Stream of org.freedesktop.Avahi.RecordBrowser.ItemRemove signals.
  late final Stream<AvahiRecordBrowserItemRemove> itemRemove;

  /// Stream of org.freedesktop.Avahi.RecordBrowser.Failure signals.
  late final Stream<AvahiRecordBrowserFailure> failure;

  /// Stream of org.freedesktop.Avahi.RecordBrowser.AllForNow signals.
  late final Stream<AvahiRecordBrowserAllForNow> allForNow;

  /// Stream of org.freedesktop.Avahi.RecordBrowser.CacheExhausted signals.
  late final Stream<AvahiRecordBrowserCacheExhausted> cacheExhausted;

  AvahiRecordBrowser(DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path) {
    itemNew = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.RecordBrowser', 'ItemNew',
            signature: DBusSignature('iisqqayu'))
        .map((signal) => AvahiRecordBrowserItemNew(signal));

    itemRemove = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.RecordBrowser', 'ItemRemove',
            signature: DBusSignature('iisqqayu'))
        .map((signal) => AvahiRecordBrowserItemRemove(signal));

    failure = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.RecordBrowser', 'Failure',
            signature: DBusSignature('s'))
        .map((signal) => AvahiRecordBrowserFailure(signal));

    allForNow = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.RecordBrowser', 'AllForNow',
            signature: DBusSignature(''))
        .map((signal) => AvahiRecordBrowserAllForNow(signal));

    cacheExhausted = DBusRemoteObjectSignalStream(
            this, 'org.freedesktop.Avahi.RecordBrowser', 'CacheExhausted',
            signature: DBusSignature(''))
        .map((signal) => AvahiRecordBrowserCacheExhausted(signal));
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

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Free()
  Future<void> callFree(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Free', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Start()
  Future<void> callStart(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Start', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
