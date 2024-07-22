// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomMarkerImpl _$$RoomMarkerImplFromJson(Map<String, dynamic> json) =>
    _$RoomMarkerImpl(
      roomRevitId: (json['roomRevitId'] as num).toInt(),
      roomType: (json['roomType'] as num).toInt(),
      roomName: json['roomName'] as String,
      roomNumber: json['roomNumber'] as String,
      position3d:
          Position3D.fromJson(json['position3d'] as Map<String, dynamic>),
      markerSvgIcon:
          MarkerSvgIcon.fromJson(json['markerSvgIcon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoomMarkerImplToJson(_$RoomMarkerImpl instance) =>
    <String, dynamic>{
      'roomRevitId': instance.roomRevitId,
      'roomType': instance.roomType,
      'roomName': instance.roomName,
      'roomNumber': instance.roomNumber,
      'position3d': instance.position3d,
      'markerSvgIcon': instance.markerSvgIcon,
    };
