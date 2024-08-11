import 'package:freezed_annotation/freezed_annotation.dart';

part 'power.freezed.dart';
part 'power.g.dart';

@freezed
class EnergyMeter with _$EnergyMeter {
  const factory EnergyMeter({
    @Default(-1.0) double power,
    @Default(-1.0) double voltage,
    @Default(-1.0) double current,
    @Default(-1.0) double powerFactor,
    @Default(-1.0) double voltageFrequency,
  }) = _EnergyMeter;

  factory EnergyMeter.fromJson(Map<String, dynamic> json) => _$EnergyMeterFromJson(json);
}
