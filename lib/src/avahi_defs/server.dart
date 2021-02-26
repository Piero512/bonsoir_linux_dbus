// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /Users/piero512/avahi/avahi-daemon/org.freedesktop.Avahi.Server.xml

import 'package:bonsoir_linux_dbus/src/avahi_defs/constants.dart';
import 'package:dbus/dbus.dart';
import 'dart:convert' show utf8;

/// Return value of org.freedesktop.Avahi.Server.ResolveService.
class AvahiServerResolvedService extends DBusStruct {
  final List<DBusValue> values;
  AvahiServerResolvedService(Iterable<DBusValue> children)
      : values = children.toList(),
        super(children);

  int get interface => (values[0] as DBusInt32).value;
  AvahiProtocol get protocol =>
      (values[1] as DBusInt32).value.toAvahiProtocol();
  String get name => (values[2] as DBusString).value;
  String get type => (values[3] as DBusString).value;
  String get domain => (values[4] as DBusString).value;
  String get host => (values[5] as DBusString).value;
  AvahiProtocol get aprotocol =>
      (values[6] as DBusInt32).value.toAvahiProtocol();
  String get address => (values[7] as DBusString).value;
  int get port => (values[8] as DBusUint16).value;
  List<String> get txt => (values[9] as DBusArray)
      .children
      .map((child) => (child as DBusArray)
          .children
          .map((child) => (child as DBusByte).value)
          .toList())
      .map((e) => utf8.decode(e))
      .toList();
  int get flags => (values[10] as DBusUint32).value;
}

/// Signal data for org.freedesktop.Avahi.Server.StateChanged.
class AvahiServerStateChanged extends DBusSignal {
  int get state => (values[0] as DBusInt32).value;
  String get error => (values[1] as DBusString).value;

  AvahiServerStateChanged(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiServer extends DBusRemoteObject {
  AvahiServer(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('null')})
      : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod(
        'org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetVersionString()
  Future<String> callGetVersionString() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server', 'GetVersionString', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetAPIVersion()
  Future<int> callGetAPIVersion() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'GetAPIVersion', []);
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetHostName()
  Future<String> callGetHostName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'GetHostName', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.SetHostName()
  Future callSetHostName(String name) async {
    await callMethod(
        'org.freedesktop.Avahi.Server', 'SetHostName', [DBusString(name)]);
  }

  /// Invokes org.freedesktop.Avahi.Server.GetHostNameFqdn()
  Future<String> callGetHostNameFqdn() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'GetHostNameFqdn', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetDomainName()
  Future<String> callGetDomainName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'GetDomainName', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.IsNSSSupportAvailable()
  Future<bool> callIsNSSSupportAvailable() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server', 'IsNSSSupportAvailable', []);
    return (result.returnValues[0] as DBusBoolean).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetState()
  Future<int> callGetState() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'GetState', []);
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetLocalServiceCookie()
  Future<int> callGetLocalServiceCookie() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server', 'GetLocalServiceCookie', []);
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetAlternativeHostName()
  Future<String> callGetAlternativeHostName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server',
        'GetAlternativeHostName', [DBusString(name)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetAlternativeServiceName()
  Future<String> callGetAlternativeServiceName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server',
        'GetAlternativeServiceName', [DBusString(name)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetNetworkInterfaceNameByIndex()
  Future<String> callGetNetworkInterfaceNameByIndex(int index) async {
    var result = await callMethod('org.freedesktop.Avahi.Server',
        'GetNetworkInterfaceNameByIndex', [DBusInt32(index)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.GetNetworkInterfaceIndexByName()
  Future<int> callGetNetworkInterfaceIndexByName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server',
        'GetNetworkInterfaceIndexByName', [DBusString(name)]);
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.ResolveHostName()
  Future<List<DBusValue>> callResolveHostName(int interface, int protocol,
      String name, int aprotocol, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'ResolveHostName', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server.ResolveAddress()
  Future<List<DBusValue>> callResolveAddress(
      int interface, int protocol, String address, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'ResolveAddress', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(address),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server.ResolveService()
  Future<List<DBusValue>> callResolveService({int interface, int protocol,
      String name, String type, String domain, int answerProtocol, int flags}) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'ResolveService', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusInt32(answerProtocol),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server.EntryGroupNew()
  Future<String> callEntryGroupNew() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'EntryGroupNew', []);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.DomainBrowserNew()
  Future<String> callDomainBrowserNew(
      int interface, int protocol, String domain, int btype, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'DomainBrowserNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(domain),
      DBusInt32(btype),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.ServiceTypeBrowserNew()
  Future<String> callServiceTypeBrowserNew(
      int interface, int protocol, String domain, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server', 'ServiceTypeBrowserNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(domain),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.ServiceBrowserNew()
  Future<String> callServiceBrowserNew(int interface, int protocol, String type,
      String domain, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'ServiceBrowserNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(type),
      DBusString(domain),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.ServiceResolverNew()
  Future<String> callServiceResolverNew({int interface, int protocol,
      String name, String type, String domain, int answerProtocol, int flags}) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'ServiceResolverNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusInt32(answerProtocol),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.HostNameResolverNew()
  Future<String> callHostNameResolverNew(int interface, int protocol,
      String name, int aprotocol, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server', 'HostNameResolverNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.AddressResolverNew()
  Future<String> callAddressResolverNew(
      int interface, int protocol, String address, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'AddressResolverNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(address),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server.RecordBrowserNew()
  Future<String> callRecordBrowserNew(int interface, int protocol, String name,
      int clazz, int type, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server', 'RecordBrowserNew', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusUint16(clazz),
      DBusUint16(type),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Subscribes to org.freedesktop.Avahi.Server.StateChanged.
  Stream<AvahiServerStateChanged> subscribeStateChanged() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.Server', 'StateChanged');
    await for (var signal in signals) {
      if (signal.values.length == 2 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('s')) {
        yield AvahiServerStateChanged(signal);
      }
    }
  }
}
