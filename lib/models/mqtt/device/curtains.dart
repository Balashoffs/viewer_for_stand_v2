import 'package:freezed_annotation/freezed_annotation.dart';

part 'curtains.freezed.dart';
part 'curtains.g.dart';

/*
    -1 - backward
    0 - stop
    1 - forward
     */

@freezed
class CurtainsControl with _$CurtainsControl {
  const factory CurtainsControl({
    @Default(0)  int direction,
  }) = _CurtainsControl;

  factory CurtainsControl.fromJson(Map<String, dynamic> json) => _$CurtainsControlFromJson(json);
}
