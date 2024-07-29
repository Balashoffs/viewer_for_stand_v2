import 'package:freezed_annotation/freezed_annotation.dart';

part 'light.freezed.dart';
part 'light.g.dart';

@freezed
class LightControl with _$LightControl {
  const factory LightControl({
     @Default('')String name,
    required bool isOn,
  }) = _LightControl;

  factory LightControl.fromJson(Map<String, dynamic> json) => _$LightControlFromJson(json);
}
