import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/room/room_marker.dart';


import 'mqtt_device.dart';

part 'mqtt_room.freezed.dart';
part 'mqtt_room.g.dart';

@freezed
class MqttRoom with _$MqttRoom {
  const factory MqttRoom({
    required int roomId,
    required String name,
    required String number,
    required String topic,
    required int type,
    @Default([]) List<MqttDevice> devices,
    RoomMarker? roomMarker,
  }) = _MqttRoom;

  @override
  String toString() {
    return 'MqttRoom(roomId: $roomId, name: $name, number: $number, topic: $topic, type: $type,)';
  }

  factory MqttRoom.fromJson(Map<String, dynamic> json) => _$MqttRoomFromJson(json);


}


