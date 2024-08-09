import 'package:freezed_annotation/freezed_annotation.dart';

part 'marker_position_3d.freezed.dart';

part 'marker_position_3d.g.dart';

@freezed
class MarkerPosition3D with _$MarkerPosition3D{
  const factory MarkerPosition3D({
    required double x,
    required double y,
    required double z,
  }) = _MarkerPosition3D;

  factory MarkerPosition3D.fromJson(Map<String, dynamic> json) => _$MarkerPosition3DFromJson(json);
}