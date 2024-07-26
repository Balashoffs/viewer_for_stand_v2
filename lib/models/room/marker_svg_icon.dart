import 'package:freezed_annotation/freezed_annotation.dart';

part 'marker_svg_icon.freezed.dart';

part 'marker_svg_icon.g.dart';

@freezed
class MarkerSvgIcon with _$MarkerSvgIcon{
  const factory MarkerSvgIcon({
    required String on,
    required String off,
  }) = _MarkerSvgIcon;

  factory MarkerSvgIcon.fromJson(Map<String, dynamic> json) => _$MarkerSvgIconFromJson(json);
}