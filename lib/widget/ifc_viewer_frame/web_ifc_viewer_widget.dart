
import 'package:flutter/material.dart';

import 'dart:ui_web' as ui;
import 'ifc_viewer_widget.dart';
import 'dart:html' as html;

Future<void> initWebServer() async {}

String get initial => 'viewer.html';

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
  late final html.IFrameElement _iframeElement;
  late final Widget _iframeWidget;
  @override
  void initState() {
    super.initState();

    _iframeElement = html.IFrameElement()
      ..src = widget.initial
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.border = 'none'
      ..style.border = 'none';

    var key = UniqueKey().toString();
    ui.platformViewRegistry.registerViewFactory(
      key,
          (int viewId) => _iframeElement,
    );

    widget.onPostMessage?.listen((dynamic data) {
      _iframeElement.contentWindow?.postMessage(data, '*');
    });

    _iframeElement.onLoad.listen((event) {
      html.window.addEventListener('message', (event) {
        if (event is html.MessageEvent) {
          html.MessageEvent messageEvent = event;
          widget.onReceiveMessage
              ?.add(Map<String, Object?>.from(messageEvent.data));
        }
      });
    });

    _iframeElement.onAbort.listen((event) {
    });

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: key,
      onPlatformViewCreated: (_) {},
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _iframeWidget;
  }
}
