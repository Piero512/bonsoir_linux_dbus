// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.EntryGroup.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.EntryGroup.StateChanged.
class AvahiEntryGroupStateChanged extends DBusSignal {
  int get state => (values[0] as DBusInt32).value;
  String get error => (values[1] as DBusString).value;

  AvahiEntryGroupStateChanged(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiEntryGroup extends DBusRemoteObject {
  AvahiEntryGroup(DBusClient client, String destination, DBusObjectPath path)
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

  /// Invokes org.freedesktop.Avahi.EntryGroup.Free()
  Future<void> callFree() async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'Free', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.Free returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.Commit()
  Future<void> callCommit() async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'Commit', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.Commit returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.Reset()
  Future<void> callReset() async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'Reset', []);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.Reset returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.GetState()
  Future<int> callGetState() async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'GetState', []);
    if (result.signature != DBusSignature('i')) {
      throw 'org.freedesktop.Avahi.EntryGroup.GetState returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.IsEmpty()
  Future<bool> callIsEmpty() async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'IsEmpty', []);
    if (result.signature != DBusSignature('b')) {
      throw 'org.freedesktop.Avahi.EntryGroup.IsEmpty returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusBoolean).value;
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddService()
  Future<void> callAddService(
      {required int interface,
      required int protocol,
      required int flags,
      required String name,
      required String type,
      required String domain,
      required String host,
      required int port,
      required List<List<int>> txt}) async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddService', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusUint32(flags),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusString(host),
      DBusUint16(port),
      DBusArray(
          DBusSignature('ay'),
          txt.map((child) => DBusArray(
              DBusSignature('y'), child.map((child) => DBusByte(child)))))
    ]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.AddService returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddServiceSubtype()
  Future<void> callAddServiceSubtype(int interface, int protocol, int flags,
      String name, String type, String domain, String subtype) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.EntryGroup', 'AddServiceSubtype', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusUint32(flags),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusString(subtype)
    ]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.AddServiceSubtype returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.UpdateServiceTxt()
  Future<void> callUpdateServiceTxt(int interface, int protocol, int flags,
      String name, String type, String domain, List<List<int>> txt) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.EntryGroup', 'UpdateServiceTxt', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusUint32(flags),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusArray(
          DBusSignature('ay'),
          txt.map((child) => DBusArray(
              DBusSignature('y'), child.map((child) => DBusByte(child)))))
    ]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.UpdateServiceTxt returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddAddress()
  Future<void> callAddAddress(int interface, int protocol, int flags,
      String name, String address) async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddAddress', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusUint32(flags),
      DBusString(name),
      DBusString(address)
    ]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.AddAddress returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddRecord()
  Future<void> callAddRecord(int interface, int protocol, int flags,
      String name, int clazz, int type, int ttl, List<int> rdata) async {
    var result =
        await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddRecord', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusUint32(flags),
      DBusString(name),
      DBusUint16(clazz),
      DBusUint16(type),
      DBusUint32(ttl),
      DBusArray(DBusSignature('y'), rdata.map((child) => DBusByte(child)))
    ]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.EntryGroup.AddRecord returned invalid values \${result.values}';
    }
  }

  /// Subscribes to org.freedesktop.Avahi.EntryGroup.StateChanged.
  Stream<AvahiEntryGroupStateChanged> subscribeStateChanged() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.EntryGroup', 'StateChanged');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('is')) {
        return AvahiEntryGroupStateChanged(signal);
      } else {
        throw 'org.freedesktop.Avahi.EntryGroup.StateChanged contains invalid values \${signal.values}';
      }
    });
  }
}
