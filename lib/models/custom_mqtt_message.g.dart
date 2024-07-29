// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_mqtt_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomMqttMessageImpl _$$CustomMqttMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomMqttMessageImpl(
      topic: json['topic'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$CustomMqttMessageImplToJson(
        _$CustomMqttMessageImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'value': instance.value,
    };
