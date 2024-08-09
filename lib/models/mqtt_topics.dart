import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_topics.freezed.dart';
part 'mqtt_topics.g.dart';
@freezed
class MqttTopics with _$MqttTopics {
  const factory MqttTopics({
    required int id,
    required String name,
    @Default('') String topic,
  }) = _MqttTopics;

  factory MqttTopics.fromJson(Map<String, dynamic> json) => _$MqttTopicsFromJson(json);
}