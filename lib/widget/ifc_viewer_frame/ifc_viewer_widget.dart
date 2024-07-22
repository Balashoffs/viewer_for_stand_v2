import 'dart:async';

export  'android_ifc_viewer_widget.dart'  if (dart.library.html) 'web_ifc_viewer_widget.dart';

typedef OnPostMessage = Stream<Map<String, dynamic>>;
typedef OnReceiveMessage = StreamSink<Map<String, dynamic>>;