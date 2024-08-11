import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_switch_state_value.g.dart';

part 'room_switch_state_value.freezed.dart';

@freezed
class RoomSwitchStateValue with _$RoomSwitchStateValue {
  factory RoomSwitchStateValue({
    @Default(false) bool isOnLight,
    @Default(0) int isOnCurtains,
    @Default(false) bool isOnCamera,
  }) = _RoomSwitchStateValue;

  factory RoomSwitchStateValue.fromJson(Map<String, dynamic> json) =>
      _$RoomSwitchStateValueFromJson(json);
}
