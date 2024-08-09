// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'light.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LightControl _$LightControlFromJson(Map<String, dynamic> json) {
  return _LightControl.fromJson(json);
}

/// @nodoc
mixin _$LightControl {
  String get name => throw _privateConstructorUsedError;
  bool get isOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LightControlCopyWith<LightControl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightControlCopyWith<$Res> {
  factory $LightControlCopyWith(
          LightControl value, $Res Function(LightControl) then) =
      _$LightControlCopyWithImpl<$Res, LightControl>;
  @useResult
  $Res call({String name, bool isOn});
}

/// @nodoc
class _$LightControlCopyWithImpl<$Res, $Val extends LightControl>
    implements $LightControlCopyWith<$Res> {
  _$LightControlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOn = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightControlImplCopyWith<$Res>
    implements $LightControlCopyWith<$Res> {
  factory _$$LightControlImplCopyWith(
          _$LightControlImpl value, $Res Function(_$LightControlImpl) then) =
      __$$LightControlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isOn});
}

/// @nodoc
class __$$LightControlImplCopyWithImpl<$Res>
    extends _$LightControlCopyWithImpl<$Res, _$LightControlImpl>
    implements _$$LightControlImplCopyWith<$Res> {
  __$$LightControlImplCopyWithImpl(
      _$LightControlImpl _value, $Res Function(_$LightControlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOn = null,
  }) {
    return _then(_$LightControlImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LightControlImpl implements _LightControl {
  const _$LightControlImpl({this.name = '', required this.isOn});

  factory _$LightControlImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightControlImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final bool isOn;

  @override
  String toString() {
    return 'LightControl(name: $name, isOn: $isOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightControlImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, isOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LightControlImplCopyWith<_$LightControlImpl> get copyWith =>
      __$$LightControlImplCopyWithImpl<_$LightControlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightControlImplToJson(
      this,
    );
  }
}

abstract class _LightControl implements LightControl {
  const factory _LightControl({final String name, required final bool isOn}) =
      _$LightControlImpl;

  factory _LightControl.fromJson(Map<String, dynamic> json) =
      _$LightControlImpl.fromJson;

  @override
  String get name;
  @override
  bool get isOn;
  @override
  @JsonKey(ignore: true)
  _$$LightControlImplCopyWith<_$LightControlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
