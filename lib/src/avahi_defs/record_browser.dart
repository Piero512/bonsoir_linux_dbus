// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.RecordBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemNew.
class AvahiRecordBrowserItemNew extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
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
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemRemove.
class AvahiRecordBrowserItemRemove extends DBusSignal {
  int get interface_ => (values[0] as DBusInt32).value;
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
  AvahiRecordBrowser(DBusClient client, String destination, DBusObjectPath path)
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

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Free()
  Future<void> callFree() async {
    var result =
        await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.RecordBrowser.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.RecordBrowser.Start()
  Future<void> callStart() async {
    var result =
        await callMethod('org.freedesktop.Avahi.RecordBrowser', 'Start', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.RecordBrowser.Start returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.ItemNew.
  Stream<AvahiRecordBrowserItemNew> subscribeItemNew() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemNew');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisqqayu')) {
        return AvahiRecordBrowserItemNew(signal);
      } else {
        throw 'org.freedesktop.Avahi.RecordBrowser.ItemNew contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.ItemRemove.
  Stream<AvahiRecordBrowserItemRemove> subscribeItemRemove() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemRemove');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('iisqqayu')) {
        return AvahiRecordBrowserItemRemove(signal);
      } else {
        throw 'org.freedesktop.Avahi.RecordBrowser.ItemRemove contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.Failure.
  Stream<AvahiRecordBrowserFailure> subscribeFailure() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'Failure');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('s')) {
        return AvahiRecordBrowserFailure(signal);
      } else {
        throw 'org.freedesktop.Avahi.RecordBrowser.Failure contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.AllForNow.
  Stream<AvahiRecordBrowserAllForNow> subscribeAllForNow() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'AllForNow');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiRecordBrowserAllForNow(signal);
      } else {
        throw 'org.freedesktop.Avahi.RecordBrowser.AllForNow contains invalid values \${signal.values}';
      }
    });
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
  Stream<AvahiRecordBrowserCacheExhausted> subscribeCacheExhausted() {
    var signals = subscribeSignal(
        'org.freedesktop.Avahi.RecordBrowser', 'CacheExhausted');
    return signals.map((signal) {
      if (signal.values.isEmpty) {
        return AvahiRecordBrowserCacheExhausted(signal);
      } else {
        throw 'org.freedesktop.Avahi.RecordBrowser.CacheExhausted contains invalid values \${signal.values}';
      }
    });
  }
}
