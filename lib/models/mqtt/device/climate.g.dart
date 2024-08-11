// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClimateMeterImpl _$$ClimateMeterImplFromJson(Map<String, dynamic> json) =>
    _$ClimateMeterImpl(
      temperature: (json['temperature'] as num?)?.toDouble() ?? -1.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? -1.0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? -1.0,
      co2: (json['co2'] as num?)?.toDouble() ?? -1.0,
      tvoc: (json['tvoc'] as num?)?.toDouble() ?? -1.0,
    );

Map<String, dynamic> _$$ClimateMeterImplToJson(_$ClimateMeterImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'co2': instance.co2,
      'tvoc': instance.tvoc,
    };
