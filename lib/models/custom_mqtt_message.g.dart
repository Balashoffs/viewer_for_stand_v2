// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_mqtt_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublishMqttMessageImpl _$$PublishMqttMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$PublishMqttMessageImpl(
      topic: json['topic'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$PublishMqttMessageImplToJson(
        _$PublishMqttMessageImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'value': instance.value,
    };

_$PollMqttMessageImpl _$$PollMqttMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$PollMqttMessageImpl(
      topic: json['topic'] ?? '',
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      map: json['map'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$PollMqttMessageImplToJson(
        _$PollMqttMessageImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'map': instance.map,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.undef: 'undef',
  DeviceType.climate: 'climate',
  DeviceType.light: 'light',
  DeviceType.curtains: 'curtains',
  DeviceType.power: 'power',
  DeviceType.camera: 'camera',
};
