
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';

part 'custom_mqtt_message.freezed.dart';
part 'custom_mqtt_message.g.dart';

@freezed
class PublishMqttMessage with _$PublishMqttMessage{
  const factory PublishMqttMessage({
    required String topic,
    required String value,
  }) = _PublishMqttMessage;

  factory PublishMqttMessage.fromJson(Map<String, dynamic> json) => _$PublishMqttMessageFromJson(json);
}

@freezed
class PollMqttMessage with _$PollMqttMessage{
  const factory PollMqttMessage({
    @Default('') topic,
    required DeviceType type,
    required Map<String, dynamic> map,
  }) = _PollMqttMessage;

  factory PollMqttMessage.fromJson(Map<String, dynamic> json) => _$PollMqttMessageFromJson(json);
}