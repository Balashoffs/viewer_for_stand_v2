
import 'package:freezed_annotation/freezed_annotation.dart';
part 'device.freezed.dart';
part 'device.g.dart';
@freezed
class Device with _$Device{
  const factory Device({
    required int roomId,
    required String roomType,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}