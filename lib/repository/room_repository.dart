import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/room/room_marker_with_id.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state_data.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';

class RoomRepository extends RoomMarkerRepository {
  final StreamController<RoomStateData> _postRoomController =
      StreamController.broadcast();

  Stream<RoomStateData> get getPostRoomStream => _postRoomController.stream;

  RoomStateData _roomStateData = RoomStateData();

  void postRoomMarkId(MessageAsMap incoming) async {
    Map<String, Object> message = Map.from(incoming);
    MessageTypeMV type = MessageTypeMV.findBy(message['type'] as String);
    if (type == MessageTypeMV.postSelectMarkVM) {
      String json = message['body'] as String;
      int roomId = jsonDecode(json)['roomId'] ?? -1;
      if (roomId != -1) {
        await selectingRoom(roomId);
      }
    }
  }

  void close() {
    _postRoomController.close();
  }

  Future<void> selectingRoom(int roomId) async {
    MqttRoom? mqr = roomId == 1 ? defaultRooms : getRoom(roomId);
    if (mqr != null) {
      updateRoomStateData(mqr);
      _postRoomController.sink.add(_roomStateData);
    }
  }

  void updateRoomStateData(MqttRoom mqttRoom) {
    if (mqttRoom.roomId == _roomStateData.currentRoom?.roomId) {
      _roomStateData = _roomStateData.copyWith(
        lastRoom: _roomStateData.currentRoom,
        currentRoom: defaultRooms,
      );
    } else {
      _roomStateData = _roomStateData.copyWith(
        lastRoom: _roomStateData.currentRoom,
        currentRoom: mqttRoom,
      );
    }
  }
}

class RoomMarkerRepository {
  final Map<int, MqttRoom> _rooms = {};
  late final MqttRoom defaultRooms;
  final Map<int, List<MqttDevice>> _devices = {};

  Future<void> loadFromAsset() async {
    String json = await rootBundle.loadString('assets/jsons/rooms.json');
    var foundRooms = jsonDecode(json).map((map) {
      MqttRoom mqttRoom = MqttRoom.fromJson(map);
      return mqttRoom;
    }).toList();
    for (var element in foundRooms) {
      _rooms[element.roomId] = element;
      _devices[element.roomId] = element.devices;
    }

    json = await rootBundle.loadString('assets/jsons/default.json');
    Map<String, dynamic> map = jsonDecode(json);
    defaultRooms = MqttRoom.fromJson(map);
  }

  List<RoomMarkerWithId> getMarkers() {
    return _rooms.values
        .map(
          (e) => RoomMarkerWithId(
            position3D: e.roomMarker!.position3D,
            markerSvgIcon: e.roomMarker!.markerSvgIcon,
            roomId: e.roomId,
          ),
        )
        .nonNulls
        .toList();
  }

  MqttRoom? getRoom(int roomId) {
    return _rooms[roomId];
  }

  List<MqttDevice> getDevices(int roomId) {
    return _devices[roomId] ?? [];
  }

  List<MqttDevice> getAllControlDevices() {
    return _devices.values.reduce((value, element) => element
        .where(
            (element) => element.type == 'light' || element.type == 'curtains')
        .toList());
  }

  List<MqttRoom> getRooms() {
    return _rooms.values.toList();
  }
}
