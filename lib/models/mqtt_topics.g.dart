// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MqttTopicsImpl _$$MqttTopicsImplFromJson(Map<String, dynamic> json) =>
    _$MqttTopicsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      topic: json['topic'] as String? ?? '',
    );

Map<String, dynamic> _$$MqttTopicsImplToJson(_$MqttTopicsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'topic': instance.topic,
    };
