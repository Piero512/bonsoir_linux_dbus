// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.RecordBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemNew.
class OrgFreedesktopDBusIntrospectableItemNew extends DBusSignal{
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray).children.map((child) => (child as DBusByte).value).toList();
  int get flags => (values[6] as DBusUint32).value;

  OrgFreedesktopDBusIntrospectableItemNew(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.ItemRemove.
class OrgFreedesktopDBusIntrospectableItemRemove extends DBusSignal{
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get name => (values[2] as DBusString).value;
  int get clazz => (values[3] as DBusUint16).value;
  int get type => (values[4] as DBusUint16).value;
  List<int> get rdata => (values[5] as DBusArray).children.map((child) => (child as DBusByte).value).toList();
  int get flags => (values[6] as DBusUint32).value;

  OrgFreedesktopDBusIntrospectableItemRemove(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.Failure.
class OrgFreedesktopDBusIntrospectableFailure extends DBusSignal{
  String get error => (values[0] as DBusString).value;

  OrgFreedesktopDBusIntrospectableFailure(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.AllForNow.
class OrgFreedesktopDBusIntrospectableAllForNow extends DBusSignal{

  OrgFreedesktopDBusIntrospectableAllForNow(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
class OrgFreedesktopDBusIntrospectableCacheExhausted extends DBusSignal{

  OrgFreedesktopDBusIntrospectableCacheExhausted(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

class OrgFreedesktopDBusIntrospectable extends DBusRemoteObject {
  OrgFreedesktopDBusIntrospectable(DBusClient client, String destination, {DBusObjectPath path = const DBusObjectPath.unchecked('null')}) : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod('org.freedesktop.DBus.Introspectable', 'Introspect', []);
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
  Stream<OrgFreedesktopDBusIntrospectableItemNew> subscribeItemNew() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemNew');
    await for (var signal in signals) {
      if (signal.values.length == 7 && signal.values[0].signature == DBusSignature('i') && signal.values[1].signature == DBusSignature('i') && signal.values[2].signature == DBusSignature('s') && signal.values[3].signature == DBusSignature('q') && signal.values[4].signature == DBusSignature('q') && signal.values[5].signature == DBusSignature('ay') && signal.values[6].signature == DBusSignature('u')) {
        yield OrgFreedesktopDBusIntrospectableItemNew(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.ItemRemove.
  Stream<OrgFreedesktopDBusIntrospectableItemRemove> subscribeItemRemove() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'ItemRemove');
    await for (var signal in signals) {
      if (signal.values.length == 7 && signal.values[0].signature == DBusSignature('i') && signal.values[1].signature == DBusSignature('i') && signal.values[2].signature == DBusSignature('s') && signal.values[3].signature == DBusSignature('q') && signal.values[4].signature == DBusSignature('q') && signal.values[5].signature == DBusSignature('ay') && signal.values[6].signature == DBusSignature('u')) {
        yield OrgFreedesktopDBusIntrospectableItemRemove(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.Failure.
  Stream<OrgFreedesktopDBusIntrospectableFailure> subscribeFailure() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 && signal.values[0].signature == DBusSignature('s')) {
        yield OrgFreedesktopDBusIntrospectableFailure(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.AllForNow.
  Stream<OrgFreedesktopDBusIntrospectableAllForNow> subscribeAllForNow() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'AllForNow');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield OrgFreedesktopDBusIntrospectableAllForNow(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.RecordBrowser.CacheExhausted.
  Stream<OrgFreedesktopDBusIntrospectableCacheExhausted> subscribeCacheExhausted() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.RecordBrowser', 'CacheExhausted');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield OrgFreedesktopDBusIntrospectableCacheExhausted(signal);
      }
    }
  }
}
