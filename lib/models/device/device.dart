
import 'package:freezed_annotation/freezed_annotation.dart';
part 'device.freezed.dart';
part 'device.g.dart';
@freezed
class Device with _$Device{
  const factory Device({
    required int roomId,
    required int roomType,
    required String roomName,
    @Default(false) bool state,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}