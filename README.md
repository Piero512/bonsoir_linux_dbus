# bonsoir_linux_dbus

This is a Linux specific platform implementation of the [Bonsoir](https://pub.dev/packages/bonsoir) 
plugin using [DBus](https://pub.dev/packages/dbus) to directly interact with the Avahi daemon
to create and discover services. This plugin requires that the Flutter application have access to DBus to be able to communicate with the Avahi daemon (and currently doesn't check exhaustively if the Avahi daemon is working okay).

## Getting Started

To use this plugin right now, you need to manually set the platform interface instance to use
(say on your main function), like this

```dart
void main(){
    BonsoirPlatformInterface.instance = BonsoirLinuxDBus();
    runApp(HomePageWidget());
}
```
If this plugin is ever endorsed by the original plugin author, you don't need to set the platform interface instance anymore.
