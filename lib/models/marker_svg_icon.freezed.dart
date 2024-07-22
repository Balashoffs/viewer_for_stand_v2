// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marker_svg_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarkerSvgIcon _$MarkerSvgIconFromJson(Map<String, dynamic> json) {
  return _MarkerSvgIcon.fromJson(json);
}

/// @nodoc
mixin _$MarkerSvgIcon {
  String get srcOn => throw _privateConstructorUsedError;
  String get srcOff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkerSvgIconCopyWith<MarkerSvgIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerSvgIconCopyWith<$Res> {
  factory $MarkerSvgIconCopyWith(
          MarkerSvgIcon value, $Res Function(MarkerSvgIcon) then) =
      _$MarkerSvgIconCopyWithImpl<$Res, MarkerSvgIcon>;
  @useResult
  $Res call({String srcOn, String srcOff});
}

/// @nodoc
class _$MarkerSvgIconCopyWithImpl<$Res, $Val extends MarkerSvgIcon>
    implements $MarkerSvgIconCopyWith<$Res> {
  _$MarkerSvgIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srcOn = null,
    Object? srcOff = null,
  }) {
    return _then(_value.copyWith(
      srcOn: null == srcOn
          ? _value.srcOn
          : srcOn // ignore: cast_nullable_to_non_nullable
              as String,
      srcOff: null == srcOff
          ? _value.srcOff
          : srcOff // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerSvgIconImplCopyWith<$Res>
    implements $MarkerSvgIconCopyWith<$Res> {
  factory _$$MarkerSvgIconImplCopyWith(
          _$MarkerSvgIconImpl value, $Res Function(_$MarkerSvgIconImpl) then) =
      __$$MarkerSvgIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String srcOn, String srcOff});
}

/// @nodoc
class __$$MarkerSvgIconImplCopyWithImpl<$Res>
    extends _$MarkerSvgIconCopyWithImpl<$Res, _$MarkerSvgIconImpl>
    implements _$$MarkerSvgIconImplCopyWith<$Res> {
  __$$MarkerSvgIconImplCopyWithImpl(
      _$MarkerSvgIconImpl _value, $Res Function(_$MarkerSvgIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srcOn = null,
    Object? srcOff = null,
  }) {
    return _then(_$MarkerSvgIconImpl(
      srcOn: null == srcOn
          ? _value.srcOn
          : srcOn // ignore: cast_nullable_to_non_nullable
              as String,
      srcOff: null == srcOff
          ? _value.srcOff
          : srcOff // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkerSvgIconImpl implements _MarkerSvgIcon {
  const _$MarkerSvgIconImpl({required this.srcOn, required this.srcOff});

  factory _$MarkerSvgIconImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkerSvgIconImplFromJson(json);

  @override
  final String srcOn;
  @override
  final String srcOff;

  @override
  String toString() {
    return 'MarkerSvgIcon(srcOn: $srcOn, srcOff: $srcOff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerSvgIconImpl &&
            (identical(other.srcOn, srcOn) || other.srcOn == srcOn) &&
            (identical(other.srcOff, srcOff) || other.srcOff == srcOff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, srcOn, srcOff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerSvgIconImplCopyWith<_$MarkerSvgIconImpl> get copyWith =>
      __$$MarkerSvgIconImplCopyWithImpl<_$MarkerSvgIconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkerSvgIconImplToJson(
      this,
    );
  }
}

abstract class _MarkerSvgIcon implements MarkerSvgIcon {
  const factory _MarkerSvgIcon(
      {required final String srcOn,
      required final String srcOff}) = _$MarkerSvgIconImpl;

  factory _MarkerSvgIcon.fromJson(Map<String, dynamic> json) =
      _$MarkerSvgIconImpl.fromJson;

  @override
  String get srcOn;
  @override
  String get srcOff;
  @override
  @JsonKey(ignore: true)
  _$$MarkerSvgIconImplCopyWith<_$MarkerSvgIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
