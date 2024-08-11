// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curtains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurtainsControl _$CurtainsControlFromJson(Map<String, dynamic> json) {
  return _CurtainsControl.fromJson(json);
}

/// @nodoc
mixin _$CurtainsControl {
  int get direction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurtainsControlCopyWith<CurtainsControl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurtainsControlCopyWith<$Res> {
  factory $CurtainsControlCopyWith(
          CurtainsControl value, $Res Function(CurtainsControl) then) =
      _$CurtainsControlCopyWithImpl<$Res, CurtainsControl>;
  @useResult
  $Res call({int direction});
}

/// @nodoc
class _$CurtainsControlCopyWithImpl<$Res, $Val extends CurtainsControl>
    implements $CurtainsControlCopyWith<$Res> {
  _$CurtainsControlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurtainsControlImplCopyWith<$Res>
    implements $CurtainsControlCopyWith<$Res> {
  factory _$$CurtainsControlImplCopyWith(_$CurtainsControlImpl value,
          $Res Function(_$CurtainsControlImpl) then) =
      __$$CurtainsControlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int direction});
}

/// @nodoc
class __$$CurtainsControlImplCopyWithImpl<$Res>
    extends _$CurtainsControlCopyWithImpl<$Res, _$CurtainsControlImpl>
    implements _$$CurtainsControlImplCopyWith<$Res> {
  __$$CurtainsControlImplCopyWithImpl(
      _$CurtainsControlImpl _value, $Res Function(_$CurtainsControlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_$CurtainsControlImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurtainsControlImpl implements _CurtainsControl {
  const _$CurtainsControlImpl({this.direction = 0});

  factory _$CurtainsControlImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurtainsControlImplFromJson(json);

  @override
  @JsonKey()
  final int direction;

  @override
  String toString() {
    return 'CurtainsControl(direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurtainsControlImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurtainsControlImplCopyWith<_$CurtainsControlImpl> get copyWith =>
      __$$CurtainsControlImplCopyWithImpl<_$CurtainsControlImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurtainsControlImplToJson(
      this,
    );
  }
}

abstract class _CurtainsControl implements CurtainsControl {
  const factory _CurtainsControl({final int direction}) = _$CurtainsControlImpl;

  factory _CurtainsControl.fromJson(Map<String, dynamic> json) =
      _$CurtainsControlImpl.fromJson;

  @override
  int get direction;
  @override
  @JsonKey(ignore: true)
  _$$CurtainsControlImplCopyWith<_$CurtainsControlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
