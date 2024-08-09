// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marker_position_3d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarkerPosition3D _$MarkerPosition3DFromJson(Map<String, dynamic> json) {
  return _MarkerPosition3D.fromJson(json);
}

/// @nodoc
mixin _$MarkerPosition3D {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get z => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkerPosition3DCopyWith<MarkerPosition3D> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerPosition3DCopyWith<$Res> {
  factory $MarkerPosition3DCopyWith(
          MarkerPosition3D value, $Res Function(MarkerPosition3D) then) =
      _$MarkerPosition3DCopyWithImpl<$Res, MarkerPosition3D>;
  @useResult
  $Res call({double x, double y, double z});
}

/// @nodoc
class _$MarkerPosition3DCopyWithImpl<$Res, $Val extends MarkerPosition3D>
    implements $MarkerPosition3DCopyWith<$Res> {
  _$MarkerPosition3DCopyWithImpl(this._value, this._then);

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
abstract class _$$MarkerPosition3DImplCopyWith<$Res>
    implements $MarkerPosition3DCopyWith<$Res> {
  factory _$$MarkerPosition3DImplCopyWith(_$MarkerPosition3DImpl value,
          $Res Function(_$MarkerPosition3DImpl) then) =
      __$$MarkerPosition3DImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, double z});
}

/// @nodoc
class __$$MarkerPosition3DImplCopyWithImpl<$Res>
    extends _$MarkerPosition3DCopyWithImpl<$Res, _$MarkerPosition3DImpl>
    implements _$$MarkerPosition3DImplCopyWith<$Res> {
  __$$MarkerPosition3DImplCopyWithImpl(_$MarkerPosition3DImpl _value,
      $Res Function(_$MarkerPosition3DImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_$MarkerPosition3DImpl(
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
class _$MarkerPosition3DImpl implements _MarkerPosition3D {
  const _$MarkerPosition3DImpl(
      {required this.x, required this.y, required this.z});

  factory _$MarkerPosition3DImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkerPosition3DImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double z;

  @override
  String toString() {
    return 'MarkerPosition3D(x: $x, y: $y, z: $z)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerPosition3DImpl &&
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
  _$$MarkerPosition3DImplCopyWith<_$MarkerPosition3DImpl> get copyWith =>
      __$$MarkerPosition3DImplCopyWithImpl<_$MarkerPosition3DImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkerPosition3DImplToJson(
      this,
    );
  }
}

abstract class _MarkerPosition3D implements MarkerPosition3D {
  const factory _MarkerPosition3D(
      {required final double x,
      required final double y,
      required final double z}) = _$MarkerPosition3DImpl;

  factory _MarkerPosition3D.fromJson(Map<String, dynamic> json) =
      _$MarkerPosition3DImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get z;
  @override
  @JsonKey(ignore: true)
  _$$MarkerPosition3DImplCopyWith<_$MarkerPosition3DImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
