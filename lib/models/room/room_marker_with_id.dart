import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/room/room_marker.dart';

import 'marker_position_3d.dart';
import 'marker_svg_icon.dart';

part 'room_marker_with_id.freezed.dart';

part 'room_marker_with_id.g.dart';

@freezed
class RoomMarkerWithId with _$RoomMarkerWithId{
  const factory RoomMarkerWithId({
    required MarkerPosition3D position3D,
    required MarkerSvgIcon markerSvgIcon,
    required int roomId,
  }) = _RoomMarkerWithId;


  factory RoomMarkerWithId.fromJson(Map<String, dynamic> json) =>
      _$RoomMarkerWithIdFromJson(json);
}