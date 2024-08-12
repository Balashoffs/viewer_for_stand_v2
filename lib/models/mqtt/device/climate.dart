import 'package:freezed_annotation/freezed_annotation.dart';

part 'climate.freezed.dart';
part 'climate.g.dart';

@freezed
class ClimateMeter with _$ClimateMeter {
  const factory ClimateMeter({
    @Default(-1.0) double temperature,
    @Default(-1.0) double humidity,
    @Default(-1.0) double pressure,
    @Default(-1.0) double co2,
    @Default(-1.0) double tvoc,
    @Default(-1.0) double voltage,
  }) = _ClimateMeter;

  factory ClimateMeter.fromJson(Map<String, dynamic> json) => _$ClimateMeterFromJson(json);
}
