import 'package:freezed_annotation/freezed_annotation.dart';

part 'light.freezed.dart';
part 'light.g.dart';

@freezed
class LightControl with _$LightControl {
  const factory LightControl({
    required String name,
    required bool state,
  }) = _LightControl;

  factory LightControl.fromJson(Map<String, dynamic> json) => _$LightControlFromJson(json);
}
