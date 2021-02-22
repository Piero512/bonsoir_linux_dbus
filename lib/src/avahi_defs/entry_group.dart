// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.EntryGroup.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.EntryGroup.StateChanged.
class AvahiEntryGroupStateChanged extends DBusSignal{
  int get state => (values[0] as DBusInt32).value;
  String get error => (values[1] as DBusString).value;

  AvahiEntryGroupStateChanged(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

class AvahiEntryGroup extends DBusRemoteObject {
  AvahiEntryGroup(DBusClient client, String destination, {DBusObjectPath path = const DBusObjectPath.unchecked('null')}) : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod('org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.Commit()
  Future callCommit() async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'Commit', []);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.Reset()
  Future callReset() async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'Reset', []);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.GetState()
  Future<int> callGetState() async {
    var result = await callMethod('org.freedesktop.Avahi.EntryGroup', 'GetState', []);
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.IsEmpty()
  Future<bool> callIsEmpty() async {
    var result = await callMethod('org.freedesktop.Avahi.EntryGroup', 'IsEmpty', []);
    return (result.returnValues[0] as DBusBoolean).value;
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddService()
  Future callAddService(int interface, int protocol, int flags, String name, String type, String domain, String host, int port, List<List<int>> txt) async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddService', [DBusInt32(interface), DBusInt32(protocol), DBusUint32(flags), DBusString(name), DBusString(type), DBusString(domain), DBusString(host), DBusUint16(port), DBusArray(DBusSignature('ay'), txt.map((child) => DBusArray(DBusSignature('y'), child.map((child) => DBusByte(child)))))]);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddServiceSubtype()
  Future callAddServiceSubtype(int interface, int protocol, int flags, String name, String type, String domain, String subtype) async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddServiceSubtype', [DBusInt32(interface), DBusInt32(protocol), DBusUint32(flags), DBusString(name), DBusString(type), DBusString(domain), DBusString(subtype)]);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.UpdateServiceTxt()
  Future callUpdateServiceTxt(int interface, int protocol, int flags, String name, String type, String domain, List<List<int>> txt) async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'UpdateServiceTxt', [DBusInt32(interface), DBusInt32(protocol), DBusUint32(flags), DBusString(name), DBusString(type), DBusString(domain), DBusArray(DBusSignature('ay'), txt.map((child) => DBusArray(DBusSignature('y'), child.map((child) => DBusByte(child)))))]);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddAddress()
  Future callAddAddress(int interface, int protocol, int flags, String name, String address) async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddAddress', [DBusInt32(interface), DBusInt32(protocol), DBusUint32(flags), DBusString(name), DBusString(address)]);
  }

  /// Invokes org.freedesktop.Avahi.EntryGroup.AddRecord()
  Future callAddRecord(int interface, int protocol, int flags, String name, int clazz, int type, int ttl, List<int> rdata) async {
    await callMethod('org.freedesktop.Avahi.EntryGroup', 'AddRecord', [DBusInt32(interface), DBusInt32(protocol), DBusUint32(flags), DBusString(name), DBusUint16(clazz), DBusUint16(type), DBusUint32(ttl), DBusArray(DBusSignature('y'), rdata.map((child) => DBusByte(child)))]);
  }

  /// Subscribes to org.freedesktop.Avahi.EntryGroup.StateChanged.
  Stream<AvahiEntryGroupStateChanged> subscribeStateChanged() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.EntryGroup', 'StateChanged');
    await for (var signal in signals) {
      if (signal.values.length == 2 && signal.values[0].signature == DBusSignature('i') && signal.values[1].signature == DBusSignature('s')) {
        yield AvahiEntryGroupStateChanged(signal);
      }
    }
  }
}
