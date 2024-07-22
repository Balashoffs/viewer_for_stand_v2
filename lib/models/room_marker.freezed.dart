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
  int get roomRevitId => throw _privateConstructorUsedError;
  int get roomType => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  String get roomNumber => throw _privateConstructorUsedError;
  Position3D get position3d => throw _privateConstructorUsedError;
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
  $Res call(
      {int roomRevitId,
      int roomType,
      String roomName,
      String roomNumber,
      Position3D position3d,
      MarkerSvgIcon markerSvgIcon});

  $Position3DCopyWith<$Res> get position3d;
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
    Object? roomRevitId = null,
    Object? roomType = null,
    Object? roomName = null,
    Object? roomNumber = null,
    Object? position3d = null,
    Object? markerSvgIcon = null,
  }) {
    return _then(_value.copyWith(
      roomRevitId: null == roomRevitId
          ? _value.roomRevitId
          : roomRevitId // ignore: cast_nullable_to_non_nullable
              as int,
      roomType: null == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as int,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      position3d: null == position3d
          ? _value.position3d
          : position3d // ignore: cast_nullable_to_non_nullable
              as Position3D,
      markerSvgIcon: null == markerSvgIcon
          ? _value.markerSvgIcon
          : markerSvgIcon // ignore: cast_nullable_to_non_nullable
              as MarkerSvgIcon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Position3DCopyWith<$Res> get position3d {
    return $Position3DCopyWith<$Res>(_value.position3d, (value) {
      return _then(_value.copyWith(position3d: value) as $Val);
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
  $Res call(
      {int roomRevitId,
      int roomType,
      String roomName,
      String roomNumber,
      Position3D position3d,
      MarkerSvgIcon markerSvgIcon});

  @override
  $Position3DCopyWith<$Res> get position3d;
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
    Object? roomRevitId = null,
    Object? roomType = null,
    Object? roomName = null,
    Object? roomNumber = null,
    Object? position3d = null,
    Object? markerSvgIcon = null,
  }) {
    return _then(_$RoomMarkerImpl(
      roomRevitId: null == roomRevitId
          ? _value.roomRevitId
          : roomRevitId // ignore: cast_nullable_to_non_nullable
              as int,
      roomType: null == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as int,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      position3d: null == position3d
          ? _value.position3d
          : position3d // ignore: cast_nullable_to_non_nullable
              as Position3D,
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
      {required this.roomRevitId,
      required this.roomType,
      required this.roomName,
      required this.roomNumber,
      required this.position3d,
      required this.markerSvgIcon});

  factory _$RoomMarkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomMarkerImplFromJson(json);

  @override
  final int roomRevitId;
  @override
  final int roomType;
  @override
  final String roomName;
  @override
  final String roomNumber;
  @override
  final Position3D position3d;
  @override
  final MarkerSvgIcon markerSvgIcon;

  @override
  String toString() {
    return 'RoomMarker(roomRevitId: $roomRevitId, roomType: $roomType, roomName: $roomName, roomNumber: $roomNumber, position3d: $position3d, markerSvgIcon: $markerSvgIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomMarkerImpl &&
            (identical(other.roomRevitId, roomRevitId) ||
                other.roomRevitId == roomRevitId) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.position3d, position3d) ||
                other.position3d == position3d) &&
            (identical(other.markerSvgIcon, markerSvgIcon) ||
                other.markerSvgIcon == markerSvgIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomRevitId, roomType, roomName,
      roomNumber, position3d, markerSvgIcon);

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
      {required final int roomRevitId,
      required final int roomType,
      required final String roomName,
      required final String roomNumber,
      required final Position3D position3d,
      required final MarkerSvgIcon markerSvgIcon}) = _$RoomMarkerImpl;

  factory _RoomMarker.fromJson(Map<String, dynamic> json) =
      _$RoomMarkerImpl.fromJson;

  @override
  int get roomRevitId;
  @override
  int get roomType;
  @override
  String get roomName;
  @override
  String get roomNumber;
  @override
  Position3D get position3d;
  @override
  MarkerSvgIcon get markerSvgIcon;
  @override
  @JsonKey(ignore: true)
  _$$RoomMarkerImplCopyWith<_$RoomMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
