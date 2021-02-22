import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.Server2.StateChanged.
class AvahiServerV2StateChanged extends DBusSignal {
  int get state => (values[0] as DBusInt32).value;
  String get error => (values[1] as DBusString).value;

  AvahiServerV2StateChanged(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.member,
            signal.values);
}

class AvahiServerV2 extends DBusRemoteObject {
  AvahiServerV2(DBusClient client, String destination, DBusObjectPath path)
      : super(client, destination, path);

  /// Invokes org.freedesktop.Avahi.Server2.GetVersionString()
  Future<String> callGetVersionString() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetVersionString', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAPIVersion()
  Future<int> callGetAPIVersion() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetAPIVersion', []);
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetHostName()
  Future<String> callGetHostName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetHostName', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.SetHostName()
  Future callSetHostName(String name) async {
    await callMethod(
        'org.freedesktop.Avahi.Server2', 'SetHostName', [DBusString(name)]);
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetHostNameFqdn()
  Future<String> callGetHostNameFqdn() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetHostNameFqdn', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetDomainName()
  Future<String> callGetDomainName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetDomainName', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.IsNSSSupportAvailable()
  Future<bool> callIsNSSSupportAvailable() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'IsNSSSupportAvailable', []);
    return (result.returnValues[0] as DBusBoolean).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetState()
  Future<int> callGetState() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetState', []);
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetLocalServiceCookie()
  Future<int> callGetLocalServiceCookie() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetLocalServiceCookie', []);
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAlternativeHostName()
  Future<String> callGetAlternativeHostName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetAlternativeHostName', [DBusString(name)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAlternativeServiceName()
  Future<String> callGetAlternativeServiceName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetAlternativeServiceName', [DBusString(name)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetNetworkInterfaceNameByIndex()
  Future<String> callGetNetworkInterfaceNameByIndex(int index) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetNetworkInterfaceNameByIndex', [DBusInt32(index)]);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetNetworkInterfaceIndexByName()
  Future<int> callGetNetworkInterfaceIndexByName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetNetworkInterfaceIndexByName', [DBusString(name)]);
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ResolveHostName()
  Future<List<DBusValue>> callResolveHostName(int interface, int protocol,
      String name, int aprotocol, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'ResolveHostName', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ResolveAddress()
  Future<List<DBusValue>> callResolveAddress(
      int interface, int protocol, String address, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'ResolveAddress', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(address),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ResolveService()
  Future<List<DBusValue>> callResolveService(int interface, int protocol,
      String name, String type, String domain, int aprotocol, int flags) async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'ResolveService', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server2.EntryGroupNew()
  Future<String> callEntryGroupNew() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'EntryGroupNew', []);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.DomainBrowserPrepare()
  Future<String> callDomainBrowserPrepare(
      int interface, int protocol, String domain, int btype, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'DomainBrowserPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(domain),
      DBusInt32(btype),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ServiceTypeBrowserPrepare()
  Future<String> callServiceTypeBrowserPrepare(
      int interface, int protocol, String domain, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'ServiceTypeBrowserPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(domain),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ServiceBrowserPrepare()
  Future<String> callServiceBrowserPrepare(int interface, int protocol,
      String type, String domain, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'ServiceBrowserPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(type),
      DBusString(domain),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.ServiceResolverPrepare()
  Future<String> callServiceResolverPrepare(int interface, int protocol,
      String name, String type, String domain, int aprotocol, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'ServiceResolverPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusString(type),
      DBusString(domain),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.HostNameResolverPrepare()
  Future<String> callHostNameResolverPrepare(int interface, int protocol,
      String name, int aprotocol, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'HostNameResolverPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusInt32(aprotocol),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.AddressResolverPrepare()
  Future<String> callAddressResolverPrepare(
      int interface, int protocol, String address, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'AddressResolverPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(address),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.RecordBrowserPrepare()
  Future<String> callRecordBrowserPrepare(int interface, int protocol,
      String name, int clazz, int type, int flags) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'RecordBrowserPrepare', [
      DBusInt32(interface),
      DBusInt32(protocol),
      DBusString(name),
      DBusUint16(clazz),
      DBusUint16(type),
      DBusUint32(flags)
    ]);
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Subscribes to org.freedesktop.Avahi.Server2.StateChanged.
  Stream<AvahiServerV2StateChanged> subscribeStateChanged() async* {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.Server2', 'StateChanged');
    await for (var signal in signals) {
      if (signal.values.length == 2 &&
          signal.values[0].signature == DBusSignature('i') &&
          signal.values[1].signature == DBusSignature('s')) {
        yield AvahiServerV2StateChanged(signal);
      }
    }
  }
}
