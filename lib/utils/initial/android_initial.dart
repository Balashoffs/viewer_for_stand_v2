import 'package:flutter_inappwebview/flutter_inappwebview.dart';



Future<void> initWebServer() async{
  final localhostServer = InAppLocalhostServer(documentRoot: 'assets/viewer', port: 9009);
  await localhostServer.start();
}

String? get initialFile => null;
URLRequest? get initialUrlRequest => URLRequest(url: WebUri('http://localhost:9009/'));