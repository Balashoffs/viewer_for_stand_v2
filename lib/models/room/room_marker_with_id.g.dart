// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_marker_with_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomMarkerWithIdImpl _$$RoomMarkerWithIdImplFromJson(
        Map<String, dynamic> json) =>
    _$RoomMarkerWithIdImpl(
      position3D:
          MarkerPosition3D.fromJson(json['position3D'] as Map<String, dynamic>),
      markerSvgIcon:
          MarkerSvgIcon.fromJson(json['markerSvgIcon'] as Map<String, dynamic>),
      roomId: (json['roomId'] as num).toInt(),
    );

Map<String, dynamic> _$$RoomMarkerWithIdImplToJson(
        _$RoomMarkerWithIdImpl instance) =>
    <String, dynamic>{
      'position3D': instance.position3D,
      'markerSvgIcon': instance.markerSvgIcon,
      'roomId': instance.roomId,
    };
