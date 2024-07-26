import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:viewer_for_stand_v2/model/device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/mqtt_topics.dart';
import 'package:viewer_for_stand_v2/models/room/marker_position_3d.dart';
import 'package:viewer_for_stand_v2/models/room/marker_svg_icon.dart';
import 'package:viewer_for_stand_v2/models/room_marker.dart' as rm1;
import 'package:viewer_for_stand_v2/models/room/room_marker.dart' as rm2;
import 'package:uuid/uuid.dart';
void main() {
  test('Update rooms and devices', () {
    String jsonOutputJson = 'assets/jsons/jsonOutput.json';
    String devicesJson = 'assets/jsons/devices.json';
    String roomJson = 'assets/jsons/rooms.json';

    File file = File(jsonOutputJson);
    String json = file.readAsStringSync();
    List<rm1.RoomMarker> rm1s = (jsonDecode(json) as List<dynamic>)
        .map((e) => rm1.RoomMarker.fromJson(e))
        .toList();

    file = File(roomJson);
    json = file.readAsStringSync();
    List<MqttRoom> rm2s = (jsonDecode(json) as List<dynamic>)
        .map((e) => MqttRoom.fromJson(e))
        .toList();

    file = File(devicesJson);
    json = file.readAsStringSync();
    List<MqttDevice> device = (jsonDecode(json) as List<dynamic>)
        .map((e) => MqttDevice.fromJson(e))
        .toList();

    List<MqttRoom> newRooms = rm2s
        .map((e) {
      int id = e.roomId;
      rm1.RoomMarker? rm1_ =
          rm1s
              .where((element) => element.roomId == id)
              .firstOrNull;
      if (rm1_ != null) {
        String topic = e.topic;
        List<MqttDevice> mqttDevice = device
            .where((element) => element.topic.contains(topic)).map((e) =>
            MqttDevice(type: e.type, topic: e.topic, uuid: Uuid().v4()),)
            .toList();

        rm2.RoomMarker rm2_ = rm2.RoomMarker(
          markerSvgIcon: MarkerSvgIcon(
            on: rm1_.markerSvgIcon.on,
            off: rm1_.markerSvgIcon.on,
          ),
          position3D: MarkerPosition3D(
            x: rm1_.position3D.x,
            y: rm1_.position3D.y,
            z: rm1_.position3D.z,
          ),
        );

        return MqttRoom(
          topic: topic,
          name: rm1_.roomName,
          roomId: id,
          type: e.type,
          number: rm1_.roomNumber,
          devices: mqttDevice,
          roomMarker: rm2_,
        );
      }
      return null;
    })
        .where((element) => element != null)
        .nonNulls
        .toList();

    String outputJson = jsonEncode(newRooms);

    File outputFile = File('outputFile.json');
    outputFile.writeAsStringSync(outputJson);
  });
}
