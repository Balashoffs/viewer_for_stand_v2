import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'ifc_viewer_widget.dart';

Future<void> initWebServer() async {
  final localhostServer =
      InAppLocalhostServer(documentRoot: 'assets/viewer', port: 9009);
  await localhostServer.start();
}

String get initial => 'http://localhost:9009/';

class IfcViewerWidget extends StatefulWidget {
  @override
  _IfcViewerWidgetState createState() => _IfcViewerWidgetState();

  final String initial;
  final OnReceiveMessage? onReceiveMessage;
  final OnPostMessage? onPostMessage;

  const IfcViewerWidget({
    super.key,
    required this.initial,
    this.onReceiveMessage,
    this.onPostMessage,
  });
}

class _IfcViewerWidgetState extends State<IfcViewerWidget> {
  final GlobalKey webViewKey = GlobalKey();
  late final URLRequest? initialUrlRequest;
  InAppWebViewController? webViewController;
  double progress = 0;

  InAppWebViewSettings settings = InAppWebViewSettings(
    allowContentAccess: true,
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    javaScriptEnabled: true,
    safeBrowsingEnabled: false,
  );

  @override
  void initState() {
    super.initState();
    initialUrlRequest = URLRequest(url: WebUri(widget.initial));
  }

  void _handleActionMessages(Map<String, dynamic> message) async {
    var webMessageChannel = await webViewController?.createWebMessageChannel();
    var port1 = webMessageChannel!.port1;
    String json = jsonEncode(message);
    webViewController!.postWebMessage(
      message: WebMessage(data: json, ports: [port1]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          key: webViewKey,
          initialUrlRequest: initialUrlRequest,
          initialUserScripts: UnmodifiableListView<UserScript>([]),
          initialSettings: settings,
          onWebViewCreated: (controller) async {
            webViewController = controller;
            webViewController?.addJavaScriptHandler(handlerName: 'viewer', callback: (args) {
              String json = args[0] as String;
              Map<String, dynamic> map = jsonDecode(json);
              widget.onReceiveMessage?.add(map);
            });
          },
          onLoadStart: (controller, url) async {},
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT);
          },
          onLoadStop: (controller, url) async {
            widget.onPostMessage?.listen(_handleActionMessages);
          },
          onReceivedError: (controller, request, error) {},
          onProgressChanged: (controller, progress) {
            if (progress == 100) {}
            setState(() {
              this.progress = progress / 100;
            });
          },
          onUpdateVisitedHistory: (controller, url, isReload) {},
          onConsoleMessage: (controller, consoleMessage) {
            //print(consoleMessage);
          },
        ),
        progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
      ],
    );
  }
}
