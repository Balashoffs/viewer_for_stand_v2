// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'power.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnergyMeter _$EnergyMeterFromJson(Map<String, dynamic> json) {
  return _EnergyMeter.fromJson(json);
}

/// @nodoc
mixin _$EnergyMeter {
  String get name => throw _privateConstructorUsedError;
  double get power => throw _privateConstructorUsedError;
  double get voltage => throw _privateConstructorUsedError;
  double get current => throw _privateConstructorUsedError;
  double get powerFactor => throw _privateConstructorUsedError;
  double get voltageFrequency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyMeterCopyWith<EnergyMeter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyMeterCopyWith<$Res> {
  factory $EnergyMeterCopyWith(
          EnergyMeter value, $Res Function(EnergyMeter) then) =
      _$EnergyMeterCopyWithImpl<$Res, EnergyMeter>;
  @useResult
  $Res call(
      {String name,
      double power,
      double voltage,
      double current,
      double powerFactor,
      double voltageFrequency});
}

/// @nodoc
class _$EnergyMeterCopyWithImpl<$Res, $Val extends EnergyMeter>
    implements $EnergyMeterCopyWith<$Res> {
  _$EnergyMeterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? power = null,
    Object? voltage = null,
    Object? current = null,
    Object? powerFactor = null,
    Object? voltageFrequency = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      voltage: null == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as double,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      powerFactor: null == powerFactor
          ? _value.powerFactor
          : powerFactor // ignore: cast_nullable_to_non_nullable
              as double,
      voltageFrequency: null == voltageFrequency
          ? _value.voltageFrequency
          : voltageFrequency // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyMeterImplCopyWith<$Res>
    implements $EnergyMeterCopyWith<$Res> {
  factory _$$EnergyMeterImplCopyWith(
          _$EnergyMeterImpl value, $Res Function(_$EnergyMeterImpl) then) =
      __$$EnergyMeterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double power,
      double voltage,
      double current,
      double powerFactor,
      double voltageFrequency});
}

/// @nodoc
class __$$EnergyMeterImplCopyWithImpl<$Res>
    extends _$EnergyMeterCopyWithImpl<$Res, _$EnergyMeterImpl>
    implements _$$EnergyMeterImplCopyWith<$Res> {
  __$$EnergyMeterImplCopyWithImpl(
      _$EnergyMeterImpl _value, $Res Function(_$EnergyMeterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? power = null,
    Object? voltage = null,
    Object? current = null,
    Object? powerFactor = null,
    Object? voltageFrequency = null,
  }) {
    return _then(_$EnergyMeterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      voltage: null == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as double,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      powerFactor: null == powerFactor
          ? _value.powerFactor
          : powerFactor // ignore: cast_nullable_to_non_nullable
              as double,
      voltageFrequency: null == voltageFrequency
          ? _value.voltageFrequency
          : voltageFrequency // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyMeterImpl implements _EnergyMeter {
  const _$EnergyMeterImpl(
      {required this.name,
      required this.power,
      required this.voltage,
      required this.current,
      required this.powerFactor,
      required this.voltageFrequency});

  factory _$EnergyMeterImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyMeterImplFromJson(json);

  @override
  final String name;
  @override
  final double power;
  @override
  final double voltage;
  @override
  final double current;
  @override
  final double powerFactor;
  @override
  final double voltageFrequency;

  @override
  String toString() {
    return 'EnergyMeter(name: $name, power: $power, voltage: $voltage, current: $current, powerFactor: $powerFactor, voltageFrequency: $voltageFrequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyMeterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.voltage, voltage) || other.voltage == voltage) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.powerFactor, powerFactor) ||
                other.powerFactor == powerFactor) &&
            (identical(other.voltageFrequency, voltageFrequency) ||
                other.voltageFrequency == voltageFrequency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, power, voltage, current,
      powerFactor, voltageFrequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyMeterImplCopyWith<_$EnergyMeterImpl> get copyWith =>
      __$$EnergyMeterImplCopyWithImpl<_$EnergyMeterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyMeterImplToJson(
      this,
    );
  }
}

abstract class _EnergyMeter implements EnergyMeter {
  const factory _EnergyMeter(
      {required final String name,
      required final double power,
      required final double voltage,
      required final double current,
      required final double powerFactor,
      required final double voltageFrequency}) = _$EnergyMeterImpl;

  factory _EnergyMeter.fromJson(Map<String, dynamic> json) =
      _$EnergyMeterImpl.fromJson;

  @override
  String get name;
  @override
  double get power;
  @override
  double get voltage;
  @override
  double get current;
  @override
  double get powerFactor;
  @override
  double get voltageFrequency;
  @override
  @JsonKey(ignore: true)
  _$$EnergyMeterImplCopyWith<_$EnergyMeterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
