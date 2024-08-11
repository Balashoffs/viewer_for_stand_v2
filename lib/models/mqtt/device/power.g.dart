// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyMeterImpl _$$EnergyMeterImplFromJson(Map<String, dynamic> json) =>
    _$EnergyMeterImpl(
      power: (json['power'] as num?)?.toDouble() ?? -1.0,
      voltage: (json['voltage'] as num?)?.toDouble() ?? -1.0,
      current: (json['current'] as num?)?.toDouble() ?? -1.0,
      powerFactor: (json['powerFactor'] as num?)?.toDouble() ?? -1.0,
      voltageFrequency: (json['voltageFrequency'] as num?)?.toDouble() ?? -1.0,
    );

Map<String, dynamic> _$$EnergyMeterImplToJson(_$EnergyMeterImpl instance) =>
    <String, dynamic>{
      'power': instance.power,
      'voltage': instance.voltage,
      'current': instance.current,
      'powerFactor': instance.powerFactor,
      'voltageFrequency': instance.voltageFrequency,
    };
