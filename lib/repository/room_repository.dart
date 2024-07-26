import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/room/room_marker_with_id.dart';

class RoomRepository {
  final Map<int, MqttRoom> _rooms = {};
  final Map<int, List<MqttDevice>> _devices = {};

  Future<void> loadFromAsset() async {
    String json = await rootBundle.loadString('assets/jsons/rooms.json');
    var foundRooms = jsonDecode(json).map((map) {
      MqttRoom mqtr = MqttRoom.fromJson(map);
      print(mqtr);
      return mqtr;
    }).toList();
    for (var element in foundRooms) {
      _rooms[element.roomId] = element;
      _devices[element.roomId] = element.devices;
    }
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
}
