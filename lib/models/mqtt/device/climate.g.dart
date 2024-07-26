// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClimateMeterImpl _$$ClimateMeterImplFromJson(Map<String, dynamic> json) =>
    _$ClimateMeterImpl(
      name: json['name'] as String? ?? '',
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      co2: (json['co2'] as num).toDouble(),
      tvoc: (json['tvoc'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClimateMeterImplToJson(_$ClimateMeterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'co2': instance.co2,
      'tvoc': instance.tvoc,
    };
