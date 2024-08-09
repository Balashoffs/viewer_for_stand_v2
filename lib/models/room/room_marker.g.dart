// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomMarkerImpl _$$RoomMarkerImplFromJson(Map<String, dynamic> json) =>
    _$RoomMarkerImpl(
      position3D:
          MarkerPosition3D.fromJson(json['position3D'] as Map<String, dynamic>),
      markerSvgIcon:
          MarkerSvgIcon.fromJson(json['markerSvgIcon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoomMarkerImplToJson(_$RoomMarkerImpl instance) =>
    <String, dynamic>{
      'position3D': instance.position3D,
      'markerSvgIcon': instance.markerSvgIcon,
    };
