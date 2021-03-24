# bonsoir_linux_dbus

This is a Linux specific platform implementation of the [Bonsoir](https://pub.dev/packages/bonsoir) 
plugin using [DBus](https://pub.dev/packages/dbus) to directly interact with the Avahi daemon
to create and discover services. This plugin requires that the Flutter application have access to DBus to be able to communicate with the Avahi daemon (and currently doesn't check exhaustively if the Avahi daemon is working okay).

## Getting Started

To use this plugin right now (as of Flutter 2), you need to manually set the platform interface instance to use
(say, on your main function), like this

```dart
void main(){
    if(Platform.isLinux){
        BonsoirPlatformInterface.instance = BonsoirLinuxDBus();
    }
    runApp(HomePageWidget());
}
```
Or when using Flutter v2.1 and beyond, the Flutter tooling is able to generate a main program that sets the
platform interfaces (Currently is not documented, but a design document exists and it's unclear when it was added to the beta)[https://docs.google.com/document/d/1G_K5vTMWD6CBD-0DDWhpAwkcCRKqmPH1wxlXu5FfRhk] 

