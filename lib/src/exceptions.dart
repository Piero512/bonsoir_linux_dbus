
import 'package:bonsoir_linux_dbus/src/avahi_defs/service_browser.dart';

class AvahiResolveFailureException implements Exception{
  final String error;
  final AvahiServiceBrowserItemNew? details;

  AvahiResolveFailureException(this.error, {this.details});


}