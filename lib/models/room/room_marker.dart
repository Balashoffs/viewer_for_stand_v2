import 'package:freezed_annotation/freezed_annotation.dart';

import 'marker_position_3d.dart';
import 'marker_svg_icon.dart';

part 'room_marker.freezed.dart';

part 'room_marker.g.dart';

@freezed
class RoomMarker with _$RoomMarker {
  const factory RoomMarker({
    required MarkerPosition3D position3D,
    required MarkerSvgIcon markerSvgIcon,
  }) = _RoomMarker;


  factory RoomMarker.fromJson(Map<String, dynamic> json) =>
      _$RoomMarkerFromJson(json);
}









