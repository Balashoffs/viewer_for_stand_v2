
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_mqtt_message.freezed.dart';
part 'custom_mqtt_message.g.dart';

@freezed
class CustomMqttMessage with _$CustomMqttMessage{
  const factory CustomMqttMessage({
    required String topic,
    required String value,
  }) = _CustomMqttMessage;

  factory CustomMqttMessage.fromJson(Map<String, dynamic> json) => _$CustomMqttMessageFromJson(json);
}