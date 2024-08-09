import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/room/room_marker.dart';


void main() async {
  test('Read json with point', () async {
    String roomJson = 'assets/jsons/outputFile.json';
    String deviceJson = 'assets/jsons/outputDeviceFile.json';

    File file = File(roomJson);
    String json = file.readAsStringSync();
    List<MqttDevice> rm1s = (jsonDecode(json) as List<dynamic>)
        .map((e) => MqttRoom.fromJson(e)).map((e) => e.devices).expand((element) => element,)
        .toList();
    json = jsonEncode(rm1s.map((e) => e.toJson()).toList());
    file = File(deviceJson);
    file.writeAsStringSync(json);
  });
}
