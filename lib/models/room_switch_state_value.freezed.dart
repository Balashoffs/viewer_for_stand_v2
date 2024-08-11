// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_switch_state_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomSwitchStateValue _$RoomSwitchStateValueFromJson(Map<String, dynamic> json) {
  return _RoomSwitchStateValue.fromJson(json);
}

/// @nodoc
mixin _$RoomSwitchStateValue {
  bool get isOnLight => throw _privateConstructorUsedError;
  int get isOnCurtains => throw _privateConstructorUsedError;
  bool get isOnCamera => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomSwitchStateValueCopyWith<RoomSwitchStateValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomSwitchStateValueCopyWith<$Res> {
  factory $RoomSwitchStateValueCopyWith(RoomSwitchStateValue value,
          $Res Function(RoomSwitchStateValue) then) =
      _$RoomSwitchStateValueCopyWithImpl<$Res, RoomSwitchStateValue>;
  @useResult
  $Res call({bool isOnLight, int isOnCurtains, bool isOnCamera});
}

/// @nodoc
class _$RoomSwitchStateValueCopyWithImpl<$Res,
        $Val extends RoomSwitchStateValue>
    implements $RoomSwitchStateValueCopyWith<$Res> {
  _$RoomSwitchStateValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnLight = null,
    Object? isOnCurtains = null,
    Object? isOnCamera = null,
  }) {
    return _then(_value.copyWith(
      isOnLight: null == isOnLight
          ? _value.isOnLight
          : isOnLight // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnCurtains: null == isOnCurtains
          ? _value.isOnCurtains
          : isOnCurtains // ignore: cast_nullable_to_non_nullable
              as int,
      isOnCamera: null == isOnCamera
          ? _value.isOnCamera
          : isOnCamera // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomSwitchStateValueImplCopyWith<$Res>
    implements $RoomSwitchStateValueCopyWith<$Res> {
  factory _$$RoomSwitchStateValueImplCopyWith(_$RoomSwitchStateValueImpl value,
          $Res Function(_$RoomSwitchStateValueImpl) then) =
      __$$RoomSwitchStateValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOnLight, int isOnCurtains, bool isOnCamera});
}

/// @nodoc
class __$$RoomSwitchStateValueImplCopyWithImpl<$Res>
    extends _$RoomSwitchStateValueCopyWithImpl<$Res, _$RoomSwitchStateValueImpl>
    implements _$$RoomSwitchStateValueImplCopyWith<$Res> {
  __$$RoomSwitchStateValueImplCopyWithImpl(_$RoomSwitchStateValueImpl _value,
      $Res Function(_$RoomSwitchStateValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnLight = null,
    Object? isOnCurtains = null,
    Object? isOnCamera = null,
  }) {
    return _then(_$RoomSwitchStateValueImpl(
      isOnLight: null == isOnLight
          ? _value.isOnLight
          : isOnLight // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnCurtains: null == isOnCurtains
          ? _value.isOnCurtains
          : isOnCurtains // ignore: cast_nullable_to_non_nullable
              as int,
      isOnCamera: null == isOnCamera
          ? _value.isOnCamera
          : isOnCamera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomSwitchStateValueImpl implements _RoomSwitchStateValue {
  _$RoomSwitchStateValueImpl(
      {this.isOnLight = false, this.isOnCurtains = 0, this.isOnCamera = false});

  factory _$RoomSwitchStateValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomSwitchStateValueImplFromJson(json);

  @override
  @JsonKey()
  final bool isOnLight;
  @override
  @JsonKey()
  final int isOnCurtains;
  @override
  @JsonKey()
  final bool isOnCamera;

  @override
  String toString() {
    return 'RoomSwitchStateValue(isOnLight: $isOnLight, isOnCurtains: $isOnCurtains, isOnCamera: $isOnCamera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomSwitchStateValueImpl &&
            (identical(other.isOnLight, isOnLight) ||
                other.isOnLight == isOnLight) &&
            (identical(other.isOnCurtains, isOnCurtains) ||
                other.isOnCurtains == isOnCurtains) &&
            (identical(other.isOnCamera, isOnCamera) ||
                other.isOnCamera == isOnCamera));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isOnLight, isOnCurtains, isOnCamera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomSwitchStateValueImplCopyWith<_$RoomSwitchStateValueImpl>
      get copyWith =>
          __$$RoomSwitchStateValueImplCopyWithImpl<_$RoomSwitchStateValueImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomSwitchStateValueImplToJson(
      this,
    );
  }
}

abstract class _RoomSwitchStateValue implements RoomSwitchStateValue {
  factory _RoomSwitchStateValue(
      {final bool isOnLight,
      final int isOnCurtains,
      final bool isOnCamera}) = _$RoomSwitchStateValueImpl;

  factory _RoomSwitchStateValue.fromJson(Map<String, dynamic> json) =
      _$RoomSwitchStateValueImpl.fromJson;

  @override
  bool get isOnLight;
  @override
  int get isOnCurtains;
  @override
  bool get isOnCamera;
  @override
  @JsonKey(ignore: true)
  _$$RoomSwitchStateValueImplCopyWith<_$RoomSwitchStateValueImpl>
      get copyWith => throw _privateConstructorUsedError;
}
