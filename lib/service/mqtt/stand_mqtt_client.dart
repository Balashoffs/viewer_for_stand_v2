export  'mobile_stand_mqtt_client.dart'  if (dart.library.html) 'web_stand_mqtt_client.dart';

typedef Incoming = Function(String, String);