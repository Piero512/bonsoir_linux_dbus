// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.RecordBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemNew.
class AvahiRecordBrowserItemNew extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray)
      .children
      .map((child) => (child as DBusByte).value)
      .toList();
  int get flags => (values[6] as DBusUint32).value;

  AvahiRecordBrowserItemNew(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemRemove.
class AvahiRecordBrowserItemRemove extends DBusSignal {
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray)
      .children
      .map((child) => (child as DBusByte).value)
      .toList();
  int get flags => (values[6] as DBusUint32).value;

  AvahiRecordBrowserItemRemove(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.Failure.
class AvahiRecordBrowserFailure extends DBusSignal {
  String get error => (values[0] as DBusString).value;

  AvahiRecordBrowserFailure(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.AllForNow.
class AvahiRecordBrowserAllForNow extends DBusSignal {
  AvahiRecordBrowserAllForNow(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
class AvahiRecordBrowserCacheExhausted extends DBusSignal {
  AvahiRecordBrowserCacheExhausted(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiRecordBrowser extends DBusRemoteObject {
  AvahiRecordBrowser(DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.ItemNew.
  Stream<AvahiRecordBrowserItemNew> subscribeItemNew() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemNew');
    await for (var signal in signals) {
      if (signal.values.length == 7 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('q') &&
          signal.values[4].signature == DBusSignature('q') &&
          signal.values[5].signature == DBusSignature('ay') &&
          signal.values[6].signature == DBusSignature('u')) {
        yield AvahiRecordBrowserItemNew(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.ItemRemove.
  Stream<AvahiRecordBrowserItemRemove> subscribeItemRemove() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemRemove');
    await for (var signal in signals) {
      if (signal.values.length == 7 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('i') &&
          signal.values[2].signature == DBusSignature('s') &&
          signal.values[3].signature == DBusSignature('q') &&
          signal.values[4].signature == DBusSignature('q') &&
          signal.values[5].signature == DBusSignature('ay') &&
          signal.values[6].signature == DBusSignature('u')) {
        yield AvahiRecordBrowserItemRemove(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.Failure.
  Stream<AvahiRecordBrowserFailure> subscribeFailure() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 &&
          signal.values[0].signature == DBusSignature('s')) {
        yield AvahiRecordBrowserFailure(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.AllForNow.
  Stream<AvahiRecordBrowserAllForNow> subscribeAllForNow() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'AllForNow');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiRecordBrowserAllForNow(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
  Stream<AvahiRecordBrowserCacheExhausted> subscribeCacheExhausted() async* {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.RecordBrowser', 'CacheExhausted');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiRecordBrowserCacheExhausted(signal);
      }
    }
  }
}
