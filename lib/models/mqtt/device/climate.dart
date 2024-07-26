import 'package:freezed_annotation/freezed_annotation.dart';

part 'climate.freezed.dart';
part 'climate.g.dart';

@freezed
class ClimateMeter with _$ClimateMeter {
  const factory ClimateMeter({
    @Default('')String name,
    required double temperature,
    required double humidity,
    required double pressure,
    required double co2,
    required double tvoc,
  }) = _ClimateMeter;

  factory ClimateMeter.fromJson(Map<String, dynamic> json) => _$ClimateMeterFromJson(json);
}
