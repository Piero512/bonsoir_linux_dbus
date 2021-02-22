// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object org.freedesktop.Avahi.ServiceTypeBrowser.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew.
class AvahiServiceTypeBrowserItemNew extends DBusSignal{
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get type => (values[2] as DBusString).value;
  String get domain => (values[3] as DBusString).value;
  int get flags => (values[4] as DBusUint32).value;

  AvahiServiceTypeBrowserItemNew(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove.
class AvahiServiceTypeBrowserItemRemove extends DBusSignal{
  int get interfaceValue => (values[0] as DBusInt32).value;
  int get protocol => (values[1] as DBusInt32).value;
  String get type => (values[2] as DBusString).value;
  String get domain => (values[3] as DBusString).value;
  int get flags => (values[4] as DBusUint32).value;

  AvahiServiceTypeBrowserItemRemove(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.Failure.
class AvahiServiceTypeBrowserFailure extends DBusSignal{
  String get error => (values[0] as DBusString).value;

  AvahiServiceTypeBrowserFailure(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow.
class AvahiServiceTypeBrowserAllForNow extends DBusSignal{

  AvahiServiceTypeBrowserAllForNow(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

/// Signal data for org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted.
class AvahiServiceTypeBrowserCacheExhausted extends DBusSignal{

  AvahiServiceTypeBrowserCacheExhausted(DBusSignal signal) : super(signal.sender, signal.path, signal.interface, signal.member, signal.values);
}

class AvahiServiceTypeBrowser extends DBusRemoteObject {
  AvahiServiceTypeBrowser(DBusClient client, String destination, {DBusObjectPath path = const DBusObjectPath.unchecked('null')}) : super(client, destination, path);

  /// Invokes org.freedesktop.DBus.Introspectable.Introspect()
  Future<String> callIntrospect() async {
    var result = await callMethod('org.freedesktop.DBus.Introspectable', 'Introspect', []);
    return (result.returnValues[0] as DBusString).value;
  }

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Free()
  Future callFree() async {
    await callMethod('org.freedesktop.Avahi.ServiceTypeBrowser', 'Free', []);
  }

  /// Invokes org.freedesktop.Avahi.ServiceTypeBrowser.Start()
  Future callStart() async {
    await callMethod('org.freedesktop.Avahi.ServiceTypeBrowser', 'Start', []);
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.ItemNew.
  Stream<AvahiServiceTypeBrowserItemNew> subscribeItemNew() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemNew');
    await for (var signal in signals) {
      if (signal.values.length == 5 && signal.values[0].signature == DBusSignature('i') && signal.values[1].signature == DBusSignature('i') && signal.values[2].signature == DBusSignature('s') && signal.values[3].signature == DBusSignature('s') && signal.values[4].signature == DBusSignature('u')) {
        yield AvahiServiceTypeBrowserItemNew(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.ItemRemove.
  Stream<AvahiServiceTypeBrowserItemRemove> subscribeItemRemove() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'ItemRemove');
    await for (var signal in signals) {
      if (signal.values.length == 5 && signal.values[0].signature == DBusSignature('i') && signal.values[1].signature == DBusSignature('i') && signal.values[2].signature == DBusSignature('s') && signal.values[3].signature == DBusSignature('s') && signal.values[4].signature == DBusSignature('u')) {
        yield AvahiServiceTypeBrowserItemRemove(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.Failure.
  Stream<AvahiServiceTypeBrowserFailure> subscribeFailure() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'Failure');
    await for (var signal in signals) {
      if (signal.values.length == 1 && signal.values[0].signature == DBusSignature('s')) {
        yield AvahiServiceTypeBrowserFailure(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.AllForNow.
  Stream<AvahiServiceTypeBrowserAllForNow> subscribeAllForNow() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'AllForNow');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiServiceTypeBrowserAllForNow(signal);
      }
    }
  }

  /// Subscribes to org.freedesktop.Avahi.ServiceTypeBrowser.CacheExhausted.
  Stream<AvahiServiceTypeBrowserCacheExhausted> subscribeCacheExhausted() async* {
    var signals = subscribeSignal('org.freedesktop.Avahi.ServiceTypeBrowser', 'CacheExhausted');
    await for (var signal in signals) {
      if (signal.values.isEmpty) {
        yield AvahiServiceTypeBrowserCacheExhausted(signal);
      }
    }
  }
}
