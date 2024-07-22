import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:viewer_for_stand_v2/models/room_marker.dart';

import 'message_mv.dart';

typedef PostMessage = FutureOr<void> Function(dynamic data);
typedef MessageAsMap = Map<String, dynamic>;
typedef BlobsCallback = Function(List<Map<String, dynamic>>);

class ViewerRepository {

  late MessageMVPuller _messageMVPuller;

  final StreamController<MessageAsMap> _postController = StreamController();
  final StreamController<MessageAsMap> _getController = StreamController();

  Stream<MessageAsMap> get postStream => _postController.stream;
  StreamSink<MessageAsMap> get getSinkStream => _getController.sink;

  void init() {
    _messageMVPuller = MessageMVPuller(sink: _postController.sink);
    _getController.stream.listen(
      messageHandler,
      onDone: () {
      },
    );

  }

  void close() {
    _postController.close();
    _getController.close();
  }

  void messageHandler(event) async {
    MessageAsMap incoming = event;
    print('incoming message: ${incoming}');
    MessageTypeMV? incomingType = MessageTypeMV.values.where((element) => element.api == incoming['type']).firstOrNull;
    if (incomingType != null) {
      if (incomingType case MessageTypeMV.postLoadModelVM) {
        String json =  await rootBundle.loadString('assets/jsons/jsonOutput.json');
        _messageMVPuller.postMessage({'config':json}, MessageTypeMV.postConfigMV);
      }
    }
  }

}

class MessageMVPuller {
  final StreamSink<MessageAsMap> _sink;

  const MessageMVPuller({
    required StreamSink<Map<String, dynamic>> sink,
  }) : _sink = sink;

  void postMessage(MessageAsMap body, MessageTypeMV type) {
    MessageMV messageMV = MessageMV.toMessage(typeMV: type, body: body);
    _sink.add(messageMV.message);
  }
}
