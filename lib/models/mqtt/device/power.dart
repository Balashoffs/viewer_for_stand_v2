import 'package:freezed_annotation/freezed_annotation.dart';

part 'power.freezed.dart';
part 'power.g.dart';

@freezed
class EnergyMeter with _$EnergyMeter {
  const factory EnergyMeter({
    required String name,
    required double power,
    required double voltage,
    required double current,
    required double powerFactor,
    required double voltageFrequency,
  }) = _EnergyMeter;

  factory EnergyMeter.fromJson(Map<String, dynamic> json) => _$EnergyMeterFromJson(json);
}
