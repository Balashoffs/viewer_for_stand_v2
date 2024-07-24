import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/position_3d.dart';

import 'marker_svg_icon.dart';

part 'room_marker.freezed.dart';

part 'room_marker.g.dart';

@freezed
class RoomMarker with _$RoomMarker {
  const factory RoomMarker({
    required int roomRevitId,
    required int roomType,
    required String roomName,
    required String roomNumber,
    required Position3D position3D,
    required MarkerSvgIcon markerSvgIcon,
  }) = _RoomMarker;


  factory RoomMarker.fromJson(Map<String, dynamic> json) =>
      _$RoomMarkerFromJson(json);
}






