// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MqttRoomImpl _$$MqttRoomImplFromJson(Map<String, dynamic> json) =>
    _$MqttRoomImpl(
      roomId: (json['roomId'] as num).toInt(),
      name: json['name'] as String,
      number: json['number'] as String,
      topic: json['topic'] as String,
      iconPath: json['iconPath'] as String,
      type: (json['type'] as num).toInt(),
      roomMarker: json['roomMarker'] == null
          ? null
          : RoomMarker.fromJson(json['roomMarker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MqttRoomImplToJson(_$MqttRoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'name': instance.name,
      'number': instance.number,
      'topic': instance.topic,
      'iconPath': instance.iconPath,
      'type': instance.type,
      'roomMarker': instance.roomMarker,
    };
