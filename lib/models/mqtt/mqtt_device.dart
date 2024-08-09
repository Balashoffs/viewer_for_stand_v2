import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_device.freezed.dart';
part 'mqtt_device.g.dart';
@freezed
class MqttDevice with _$MqttDevice {
  const factory MqttDevice({
    required String topic,
    required String type,
  }) = _MqttDevice;
  factory MqttDevice.fromJson(Map<String, dynamic> json) => _$MqttDeviceFromJson(json);

}


