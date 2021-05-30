// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.Server2.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.Server2.StateChanged.
class AvahiServer2StateChanged extends DBusSignal {
  int get state => (values[0] as DBusInt32).value;
  String get error => (values[1] as DBusString).value;

  AvahiServer2StateChanged(DBusSignal signal)
      : super(signal.sender, signal.path, signal.interface, signal.name,
            signal.values);
}

class AvahiServer2 extends DBusRemoteObject {
  AvahiServer2(DBusClient client, String destination, DBusObjectPath path)
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

  /// Invokes org.freedesktop.Avahi.Server2.GetVersionString()
  Future<String> callGetVersionString() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetVersionString', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetVersionString returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAPIVersion()
  Future<int> callGetAPIVersion() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetAPIVersion', []);
    if (result.signature != DBusSignature('u')) {
      throw 'org.freedesktop.Avahi.Server2.GetAPIVersion returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetHostName()
  Future<String> callGetHostName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetHostName', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetHostName returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.SetHostName()
  Future<void> callSetHostName(String name) async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'SetHostName', [DBusString(name)]);
    if (result.signature != DBusSignature('')) {
      throw 'org.freedesktop.Avahi.Server2.SetHostName returned invalid values \${result.values}';
    }
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetHostNameFqdn()
  Future<String> callGetHostNameFqdn() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetHostNameFqdn', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetHostNameFqdn returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetDomainName()
  Future<String> callGetDomainName() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetDomainName', []);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetDomainName returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.IsNSSSupportAvailable()
  Future<bool> callIsNSSSupportAvailable() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'IsNSSSupportAvailable', []);
    if (result.signature != DBusSignature('b')) {
      throw 'org.freedesktop.Avahi.Server2.IsNSSSupportAvailable returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusBoolean).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetState()
  Future<int> callGetState() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'GetState', []);
    if (result.signature != DBusSignature('i')) {
      throw 'org.freedesktop.Avahi.Server2.GetState returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusInt32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetLocalServiceCookie()
  Future<int> callGetLocalServiceCookie() async {
    var result = await callMethod(
        'org.freedesktop.Avahi.Server2', 'GetLocalServiceCookie', []);
    if (result.signature != DBusSignature('u')) {
      throw 'org.freedesktop.Avahi.Server2.GetLocalServiceCookie returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusUint32).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAlternativeHostName()
  Future<String> callGetAlternativeHostName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetAlternativeHostName', [DBusString(name)]);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetAlternativeHostName returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetAlternativeServiceName()
  Future<String> callGetAlternativeServiceName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetAlternativeServiceName', [DBusString(name)]);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetAlternativeServiceName returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetNetworkInterfaceNameByIndex()
  Future<String> callGetNetworkInterfaceNameByIndex(int index) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetNetworkInterfaceNameByIndex', [DBusInt32(index)]);
    if (result.signature != DBusSignature('s')) {
      throw 'org.freedesktop.Avahi.Server2.GetNetworkInterfaceNameByIndex returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.Server2.GetNetworkInterfaceIndexByName()
  Future<int> callGetNetworkInterfaceIndexByName(String name) async {
    var result = await callMethod('org.freedesktop.Avahi.Server2',
        'GetNetworkInterfaceIndexByName', [DBusString(name)]);
    if (result.signature != DBusSignature('i')) {
      throw 'org.freedesktop.Avahi.Server2.GetNetworkInterfaceIndexByName returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('iisisu')) {
      throw 'org.freedesktop.Avahi.Server2.ResolveHostName returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('iiissu')) {
      throw 'org.freedesktop.Avahi.Server2.ResolveAddress returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('iissssisqaayu')) {
      throw 'org.freedesktop.Avahi.Server2.ResolveService returned invalid values \${result.values}';
    }
    return result.returnValues;
  }

  /// Invokes org.freedesktop.Avahi.Server2.EntryGroupNew()
  Future<String> callEntryGroupNew() async {
    var result =
        await callMethod('org.freedesktop.Avahi.Server2', 'EntryGroupNew', []);
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.EntryGroupNew returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.DomainBrowserPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.ServiceTypeBrowserPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.ServiceBrowserPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.ServiceResolverPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.HostNameResolverPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.AddressResolverPrepare returned invalid values \${result.values}';
    }
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
    if (result.signature != DBusSignature('o')) {
      throw 'org.freedesktop.Avahi.Server2.RecordBrowserPrepare returned invalid values \${result.values}';
    }
    return (result.returnValues[0] as DBusObjectPath).value;
  }

  /// Subscribes to org.freedesktop.Avahi.Server2.StateChanged.
  Stream<AvahiServer2StateChanged> subscribeStateChanged() {
    var signals =
        subscribeSignal('org.freedesktop.Avahi.Server2', 'StateChanged');
    return signals.map((signal) {
      if (signal.signature == DBusSignature('is')) {
        return AvahiServer2StateChanged(signal);
      } else {
        throw 'org.freedesktop.Avahi.Server2.StateChanged contains invalid values \${signal.values}';
      }
    });
  }
}
