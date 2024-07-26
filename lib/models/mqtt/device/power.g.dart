// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyMeterImpl _$$EnergyMeterImplFromJson(Map<String, dynamic> json) =>
    _$EnergyMeterImpl(
      name: json['name'] as String,
      power: (json['power'] as num).toDouble(),
      voltage: (json['voltage'] as num).toDouble(),
      current: (json['current'] as num).toDouble(),
      powerFactor: (json['powerFactor'] as num).toDouble(),
      voltageFrequency: (json['voltageFrequency'] as num).toDouble(),
    );

Map<String, dynamic> _$$EnergyMeterImplToJson(_$EnergyMeterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'power': instance.power,
      'voltage': instance.voltage,
      'current': instance.current,
      'powerFactor': instance.powerFactor,
      'voltageFrequency': instance.voltageFrequency,
    };
