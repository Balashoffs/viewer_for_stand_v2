import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_3d.freezed.dart';

part 'position_3d.g.dart';

@freezed
class Position3D with _$Position3D{
  const factory Position3D({
    required double x,
    required double y,
    required double z,
  }) = _Position3D;

  factory Position3D.fromJson(Map<String, Object?> json) => _$Position3DFromJson(json);
}