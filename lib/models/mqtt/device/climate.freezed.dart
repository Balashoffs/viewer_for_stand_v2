// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'climate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClimateMeter _$ClimateMeterFromJson(Map<String, dynamic> json) {
  return _ClimateMeter.fromJson(json);
}

/// @nodoc
mixin _$ClimateMeter {
  double get temperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  double get co2 => throw _privateConstructorUsedError;
  double get tvoc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClimateMeterCopyWith<ClimateMeter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClimateMeterCopyWith<$Res> {
  factory $ClimateMeterCopyWith(
          ClimateMeter value, $Res Function(ClimateMeter) then) =
      _$ClimateMeterCopyWithImpl<$Res, ClimateMeter>;
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double pressure,
      double co2,
      double tvoc});
}

/// @nodoc
class _$ClimateMeterCopyWithImpl<$Res, $Val extends ClimateMeter>
    implements $ClimateMeterCopyWith<$Res> {
  _$ClimateMeterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? co2 = null,
    Object? tvoc = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as double,
      tvoc: null == tvoc
          ? _value.tvoc
          : tvoc // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClimateMeterImplCopyWith<$Res>
    implements $ClimateMeterCopyWith<$Res> {
  factory _$$ClimateMeterImplCopyWith(
          _$ClimateMeterImpl value, $Res Function(_$ClimateMeterImpl) then) =
      __$$ClimateMeterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double pressure,
      double co2,
      double tvoc});
}

/// @nodoc
class __$$ClimateMeterImplCopyWithImpl<$Res>
    extends _$ClimateMeterCopyWithImpl<$Res, _$ClimateMeterImpl>
    implements _$$ClimateMeterImplCopyWith<$Res> {
  __$$ClimateMeterImplCopyWithImpl(
      _$ClimateMeterImpl _value, $Res Function(_$ClimateMeterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? co2 = null,
    Object? tvoc = null,
  }) {
    return _then(_$ClimateMeterImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as double,
      tvoc: null == tvoc
          ? _value.tvoc
          : tvoc // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClimateMeterImpl implements _ClimateMeter {
  const _$ClimateMeterImpl(
      {this.temperature = -1.0,
      this.humidity = -1.0,
      this.pressure = -1.0,
      this.co2 = -1.0,
      this.tvoc = -1.0});

  factory _$ClimateMeterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClimateMeterImplFromJson(json);

  @override
  @JsonKey()
  final double temperature;
  @override
  @JsonKey()
  final double humidity;
  @override
  @JsonKey()
  final double pressure;
  @override
  @JsonKey()
  final double co2;
  @override
  @JsonKey()
  final double tvoc;

  @override
  String toString() {
    return 'ClimateMeter(temperature: $temperature, humidity: $humidity, pressure: $pressure, co2: $co2, tvoc: $tvoc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClimateMeterImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.co2, co2) || other.co2 == co2) &&
            (identical(other.tvoc, tvoc) || other.tvoc == tvoc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temperature, humidity, pressure, co2, tvoc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClimateMeterImplCopyWith<_$ClimateMeterImpl> get copyWith =>
      __$$ClimateMeterImplCopyWithImpl<_$ClimateMeterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClimateMeterImplToJson(
      this,
    );
  }
}

abstract class _ClimateMeter implements ClimateMeter {
  const factory _ClimateMeter(
      {final double temperature,
      final double humidity,
      final double pressure,
      final double co2,
      final double tvoc}) = _$ClimateMeterImpl;

  factory _ClimateMeter.fromJson(Map<String, dynamic> json) =
      _$ClimateMeterImpl.fromJson;

  @override
  double get temperature;
  @override
  double get humidity;
  @override
  double get pressure;
  @override
  double get co2;
  @override
  double get tvoc;
  @override
  @JsonKey(ignore: true)
  _$$ClimateMeterImplCopyWith<_$ClimateMeterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
