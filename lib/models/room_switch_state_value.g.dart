// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_switch_state_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomSwitchStateValueImpl _$$RoomSwitchStateValueImplFromJson(
        Map<String, dynamic> json) =>
    _$RoomSwitchStateValueImpl(
      isOnLight: json['isOnLight'] as bool? ?? false,
      isOnCurtains: (json['isOnCurtains'] as num?)?.toInt() ?? 0,
      isOnCamera: json['isOnCamera'] as bool? ?? false,
    );

Map<String, dynamic> _$$RoomSwitchStateValueImplToJson(
        _$RoomSwitchStateValueImpl instance) =>
    <String, dynamic>{
      'isOnLight': instance.isOnLight,
      'isOnCurtains': instance.isOnCurtains,
      'isOnCamera': instance.isOnCamera,
    };
