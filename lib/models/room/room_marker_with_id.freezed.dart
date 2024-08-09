// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_marker_with_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomMarkerWithId _$RoomMarkerWithIdFromJson(Map<String, dynamic> json) {
  return _RoomMarkerWithId.fromJson(json);
}

/// @nodoc
mixin _$RoomMarkerWithId {
  MarkerPosition3D get position3D => throw _privateConstructorUsedError;
  MarkerSvgIcon get markerSvgIcon => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomMarkerWithIdCopyWith<RoomMarkerWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomMarkerWithIdCopyWith<$Res> {
  factory $RoomMarkerWithIdCopyWith(
          RoomMarkerWithId value, $Res Function(RoomMarkerWithId) then) =
      _$RoomMarkerWithIdCopyWithImpl<$Res, RoomMarkerWithId>;
  @useResult
  $Res call(
      {MarkerPosition3D position3D, MarkerSvgIcon markerSvgIcon, int roomId});

  $MarkerPosition3DCopyWith<$Res> get position3D;
  $MarkerSvgIconCopyWith<$Res> get markerSvgIcon;
}

/// @nodoc
class _$RoomMarkerWithIdCopyWithImpl<$Res, $Val extends RoomMarkerWithId>
    implements $RoomMarkerWithIdCopyWith<$Res> {
  _$RoomMarkerWithIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position3D = null,
    Object? markerSvgIcon = null,
    Object? roomId = null,
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
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$RoomMarkerWithIdImplCopyWith<$Res>
    implements $RoomMarkerWithIdCopyWith<$Res> {
  factory _$$RoomMarkerWithIdImplCopyWith(_$RoomMarkerWithIdImpl value,
          $Res Function(_$RoomMarkerWithIdImpl) then) =
      __$$RoomMarkerWithIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MarkerPosition3D position3D, MarkerSvgIcon markerSvgIcon, int roomId});

  @override
  $MarkerPosition3DCopyWith<$Res> get position3D;
  @override
  $MarkerSvgIconCopyWith<$Res> get markerSvgIcon;
}

/// @nodoc
class __$$RoomMarkerWithIdImplCopyWithImpl<$Res>
    extends _$RoomMarkerWithIdCopyWithImpl<$Res, _$RoomMarkerWithIdImpl>
    implements _$$RoomMarkerWithIdImplCopyWith<$Res> {
  __$$RoomMarkerWithIdImplCopyWithImpl(_$RoomMarkerWithIdImpl _value,
      $Res Function(_$RoomMarkerWithIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position3D = null,
    Object? markerSvgIcon = null,
    Object? roomId = null,
  }) {
    return _then(_$RoomMarkerWithIdImpl(
      position3D: null == position3D
          ? _value.position3D
          : position3D // ignore: cast_nullable_to_non_nullable
              as MarkerPosition3D,
      markerSvgIcon: null == markerSvgIcon
          ? _value.markerSvgIcon
          : markerSvgIcon // ignore: cast_nullable_to_non_nullable
              as MarkerSvgIcon,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomMarkerWithIdImpl implements _RoomMarkerWithId {
  const _$RoomMarkerWithIdImpl(
      {required this.position3D,
      required this.markerSvgIcon,
      required this.roomId});

  factory _$RoomMarkerWithIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomMarkerWithIdImplFromJson(json);

  @override
  final MarkerPosition3D position3D;
  @override
  final MarkerSvgIcon markerSvgIcon;
  @override
  final int roomId;

  @override
  String toString() {
    return 'RoomMarkerWithId(position3D: $position3D, markerSvgIcon: $markerSvgIcon, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomMarkerWithIdImpl &&
            (identical(other.position3D, position3D) ||
                other.position3D == position3D) &&
            (identical(other.markerSvgIcon, markerSvgIcon) ||
                other.markerSvgIcon == markerSvgIcon) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, position3D, markerSvgIcon, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomMarkerWithIdImplCopyWith<_$RoomMarkerWithIdImpl> get copyWith =>
      __$$RoomMarkerWithIdImplCopyWithImpl<_$RoomMarkerWithIdImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomMarkerWithIdImplToJson(
      this,
    );
  }
}

abstract class _RoomMarkerWithId implements RoomMarkerWithId {
  const factory _RoomMarkerWithId(
      {required final MarkerPosition3D position3D,
      required final MarkerSvgIcon markerSvgIcon,
      required final int roomId}) = _$RoomMarkerWithIdImpl;

  factory _RoomMarkerWithId.fromJson(Map<String, dynamic> json) =
      _$RoomMarkerWithIdImpl.fromJson;

  @override
  MarkerPosition3D get position3D;
  @override
  MarkerSvgIcon get markerSvgIcon;
  @override
  int get roomId;
  @override
  @JsonKey(ignore: true)
  _$$RoomMarkerWithIdImplCopyWith<_$RoomMarkerWithIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
