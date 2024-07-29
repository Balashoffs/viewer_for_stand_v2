// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      roomId: (json['roomId'] as num).toInt(),
      roomType: (json['roomType'] as num).toInt(),
      roomName: json['roomName'] as String,
      state: json['state'] as bool? ?? false,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomType': instance.roomType,
      'roomName': instance.roomName,
      'state': instance.state,
    };
