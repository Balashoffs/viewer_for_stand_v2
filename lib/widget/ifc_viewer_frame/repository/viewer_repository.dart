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

  final StreamController<MessageAsMap> _postViewerController = StreamController();
  final StreamController<MessageAsMap> _getViewerController = StreamController();

  Stream<MessageAsMap> get postViewerStream => _postViewerController.stream;
  StreamSink<MessageAsMap> get getViewerSinkStream => _getViewerController.sink;

  final StreamController<MessageAsMap> _postCardController = StreamController();
  final StreamController<MessageAsMap> _getCardController = StreamController();

  Stream<MessageAsMap> get postCardStream => _postCardController.stream;
  StreamSink<MessageAsMap> get getCardSinkStream => _getCardController.sink;

  void init() async{
    _messageMVPuller = MessageMVPuller(sink: _postViewerController.sink);
    _getViewerController.stream.listen(
      messageHandler,
      onDone: () {
      },
    );

  }

  void close() {
    _postViewerController.close();
    _getViewerController.close();
    _postViewerController.close();
    _getCardController.close();
  }

  void messageHandler(event) async {
    MessageAsMap incoming = event;
    print('incoming message: ${incoming}');
    MessageTypeMV? incomingType = MessageTypeMV.values.where((element) => element.api == incoming['type']).firstOrNull;
    if (incomingType != null) {
      if (incomingType case MessageTypeMV.postModelLoadedVM) {
        String json =  await rootBundle.loadString('assets/jsons/jsonOutput.json');
        _messageMVPuller.postMessage({'config':json}, MessageTypeMV.postConfigMV);
      }else if(incomingType case MessageTypeMV.postSelectMarkVM){
        _postCardController.sink.add(incoming);
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
