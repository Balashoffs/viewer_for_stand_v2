import 'dart:async';
import 'dart:convert';
import 'package:viewer_for_stand_v2/models/room/room_marker_with_id.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';

import 'message_mv.dart';

typedef PostMessage = FutureOr<void> Function(dynamic data);
typedef MessageAsMap = Map<String, dynamic>;
typedef BlobsCallback = Function(List<Map<String, dynamic>>);

class ViewerRepository {
  final RoomRepository _roomRepository;

  ViewerRepository(RoomRepository roomRepository)
      : _roomRepository = roomRepository;

  final StreamController<MessageAsMap> _postViewerController =
      StreamController();
  final StreamController<MessageAsMap> _getViewerController =
      StreamController();

  Stream<MessageAsMap> get postViewerStream => _postViewerController.stream;

  StreamSink<MessageAsMap> get getViewerSinkStream => _getViewerController.sink;
  StreamSink<MessageAsMap> get postViewerSinkStream => _postViewerController.sink;

  Future<void> init() async {
    _getViewerController.stream.listen(
      messageHandler,
      onDone: () {},
    );
  }

  void close() {
    _postViewerController.close();
    _getViewerController.close();
  }

  void messageHandler(event) async {
    MessageAsMap incoming = event;
    MessageTypeMV? incomingType = MessageTypeMV.values
        .where((element) => element.api == incoming['type'])
        .firstOrNull;
    if (incomingType != null) {
      if (incomingType case MessageTypeMV.postModelLoadedVM) {
        List<RoomMarkerWithId> markers = _roomRepository.getMarkers();
        String json = jsonEncode(markers);
        postMessage({'config': json}, MessageTypeMV.postConfigMV);
        _roomRepository.selectingRoom(1);
      } else if (incomingType case MessageTypeMV.postSelectMarkVM) {
        _roomRepository.postRoomMarkId(incoming);
      }
    }
  }

  void postMessage(MessageAsMap body, MessageTypeMV type) {
    MessageMV messageMV = MessageMV.toMessage(typeMV: type, body: body);
    _postViewerController.sink.add(messageMV.message);
  }
}
