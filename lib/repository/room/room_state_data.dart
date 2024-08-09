import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state.dart';

part 'room_state_data.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class RoomStateData with _$RoomStateData{

  factory RoomStateData ({
    MqttRoom? lastRoom,
    MqttRoom? currentRoom,
    MqttRoom? defaultRoom,
    @Default(RoomState.init) RoomState state,
  }) = _RoomStateData;

}