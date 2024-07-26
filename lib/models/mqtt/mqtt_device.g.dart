// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MqttDeviceImpl _$$MqttDeviceImplFromJson(Map<String, dynamic> json) =>
    _$MqttDeviceImpl(
      uuid: json['uuid'] as String,
      topic: json['topic'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$MqttDeviceImplToJson(_$MqttDeviceImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'topic': instance.topic,
      'type': instance.type,
    };
