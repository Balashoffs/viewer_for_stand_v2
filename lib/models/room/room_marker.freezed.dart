// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomMarker _$RoomMarkerFromJson(Map<String, dynamic> json) {
  return _RoomMarker.fromJson(json);
}

/// @nodoc
mixin _$RoomMarker {
  MarkerPosition3D get position3D => throw _privateConstructorUsedError;
  MarkerSvgIcon get markerSvgIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomMarkerCopyWith<RoomMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomMarkerCopyWith<$Res> {
  factory $RoomMarkerCopyWith(
          RoomMarker value, $Res Function(RoomMarker) then) =
      _$RoomMarkerCopyWithImpl<$Res, RoomMarker>;
  @useResult
  $Res call({MarkerPosition3D position3D, MarkerSvgIcon markerSvgIcon});

  $MarkerPosition3DCopyWith<$Res> get position3D;
  $MarkerSvgIconCopyWith<$Res> get markerSvgIcon;
}

/// @nodoc
class _$RoomMarkerCopyWithImpl<$Res, $Val extends RoomMarker>
    implements $RoomMarkerCopyWith<$Res> {
  _$RoomMarkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position3D = null,
    Object? markerSvgIcon = null,
  }) {
    return _then(_value.copyWith(
      position3D: null == position3D
          ? _value.position3D
          : position3D // ignore: cast_nullable_to_non_nullable
              as MarkerPosition3D,
      markerSvgIcon: null == markerSvgIcon
          ? _value.markerSvgIcon
          : markerSvgIcon // ignore: cast_nullable_to_non_nullable
              as MarkerSvgIcon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarkerPosition3DCopyWith<$Res> get position3D {
    return $MarkerPosition3DCopyWith<$Res>(_value.position3D, (value) {
      return _then(_value.copyWith(position3D: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarkerSvgIconCopyWith<$Res> get markerSvgIcon {
    return $MarkerSvgIconCopyWith<$Res>(_value.markerSvgIcon, (value) {
      return _then(_value.copyWith(markerSvgIcon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomMarkerImplCopyWith<$Res>
    implements $RoomMarkerCopyWith<$Res> {
  factory _$$RoomMarkerImplCopyWith(
          _$RoomMarkerImpl value, $Res Function(_$RoomMarkerImpl) then) =
      __$$RoomMarkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MarkerPosition3D position3D, MarkerSvgIcon markerSvgIcon});

  @override
  $MarkerPosition3DCopyWith<$Res> get position3D;
  @override
  $MarkerSvgIconCopyWith<$Res> get markerSvgIcon;
}

/// @nodoc
class __$$RoomMarkerImplCopyWithImpl<$Res>
    extends _$RoomMarkerCopyWithImpl<$Res, _$RoomMarkerImpl>
    implements _$$RoomMarkerImplCopyWith<$Res> {
  __$$RoomMarkerImplCopyWithImpl(
      _$RoomMarkerImpl _value, $Res Function(_$RoomMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position3D = null,
    Object? markerSvgIcon = null,
  }) {
    return _then(_$RoomMarkerImpl(
      position3D: null == position3D
          ? _value.position3D
          : position3D // ignore: cast_nullable_to_non_nullable
              as MarkerPosition3D,
      markerSvgIcon: null == markerSvgIcon
          ? _value.markerSvgIcon
          : markerSvgIcon // ignore: cast_nullable_to_non_nullable
              as MarkerSvgIcon,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomMarkerImpl implements _RoomMarker {
  const _$RoomMarkerImpl(
      {required this.position3D, required this.markerSvgIcon});

  factory _$RoomMarkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomMarkerImplFromJson(json);

  @override
  final MarkerPosition3D position3D;
  @override
  final MarkerSvgIcon markerSvgIcon;

  @override
  String toString() {
    return 'RoomMarker(position3D: $position3D, markerSvgIcon: $markerSvgIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomMarkerImpl &&
            (identical(other.position3D, position3D) ||
                other.position3D == position3D) &&
            (identical(other.markerSvgIcon, markerSvgIcon) ||
                other.markerSvgIcon == markerSvgIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, position3D, markerSvgIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomMarkerImplCopyWith<_$RoomMarkerImpl> get copyWith =>
      __$$RoomMarkerImplCopyWithImpl<_$RoomMarkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomMarkerImplToJson(
      this,
    );
  }
}

abstract class _RoomMarker implements RoomMarker {
  const factory _RoomMarker(
      {required final MarkerPosition3D position3D,
      required final MarkerSvgIcon markerSvgIcon}) = _$RoomMarkerImpl;

  factory _RoomMarker.fromJson(Map<String, dynamic> json) =
      _$RoomMarkerImpl.fromJson;

  @override
  MarkerPosition3D get position3D;
  @override
  MarkerSvgIcon get markerSvgIcon;
  @override
  @JsonKey(ignore: true)
  _$$RoomMarkerImplCopyWith<_$RoomMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
