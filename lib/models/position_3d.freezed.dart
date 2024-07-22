// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_3d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Position3D _$Position3DFromJson(Map<String, dynamic> json) {
  return _Position3D.fromJson(json);
}

/// @nodoc
mixin _$Position3D {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get z => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Position3DCopyWith<Position3D> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Position3DCopyWith<$Res> {
  factory $Position3DCopyWith(
          Position3D value, $Res Function(Position3D) then) =
      _$Position3DCopyWithImpl<$Res, Position3D>;
  @useResult
  $Res call({double x, double y, double z});
}

/// @nodoc
class _$Position3DCopyWithImpl<$Res, $Val extends Position3D>
    implements $Position3DCopyWith<$Res> {
  _$Position3DCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Position3DImplCopyWith<$Res>
    implements $Position3DCopyWith<$Res> {
  factory _$$Position3DImplCopyWith(
          _$Position3DImpl value, $Res Function(_$Position3DImpl) then) =
      __$$Position3DImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, double z});
}

/// @nodoc
class __$$Position3DImplCopyWithImpl<$Res>
    extends _$Position3DCopyWithImpl<$Res, _$Position3DImpl>
    implements _$$Position3DImplCopyWith<$Res> {
  __$$Position3DImplCopyWithImpl(
      _$Position3DImpl _value, $Res Function(_$Position3DImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_$Position3DImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Position3DImpl implements _Position3D {
  const _$Position3DImpl({required this.x, required this.y, required this.z});

  factory _$Position3DImpl.fromJson(Map<String, dynamic> json) =>
      _$$Position3DImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double z;

  @override
  String toString() {
    return 'Position3D(x: $x, y: $y, z: $z)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Position3DImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.z, z) || other.z == z));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, z);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Position3DImplCopyWith<_$Position3DImpl> get copyWith =>
      __$$Position3DImplCopyWithImpl<_$Position3DImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Position3DImplToJson(
      this,
    );
  }
}

abstract class _Position3D implements Position3D {
  const factory _Position3D(
      {required final double x,
      required final double y,
      required final double z}) = _$Position3DImpl;

  factory _Position3D.fromJson(Map<String, dynamic> json) =
      _$Position3DImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get z;
  @override
  @JsonKey(ignore: true)
  _$$Position3DImplCopyWith<_$Position3DImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
