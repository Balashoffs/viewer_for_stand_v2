// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MqttRoom _$MqttRoomFromJson(Map<String, dynamic> json) {
  return _MqttRoom.fromJson(json);
}

/// @nodoc
mixin _$MqttRoom {
  int get roomId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  List<MqttDevice> get devices => throw _privateConstructorUsedError;
  RoomMarker? get roomMarker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MqttRoomCopyWith<MqttRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MqttRoomCopyWith<$Res> {
  factory $MqttRoomCopyWith(MqttRoom value, $Res Function(MqttRoom) then) =
      _$MqttRoomCopyWithImpl<$Res, MqttRoom>;
  @useResult
  $Res call(
      {int roomId,
      String name,
      String number,
      String topic,
      String iconPath,
      int type,
      List<MqttDevice> devices,
      RoomMarker? roomMarker});

  $RoomMarkerCopyWith<$Res>? get roomMarker;
}

/// @nodoc
class _$MqttRoomCopyWithImpl<$Res, $Val extends MqttRoom>
    implements $MqttRoomCopyWith<$Res> {
  _$MqttRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? name = null,
    Object? number = null,
    Object? topic = null,
    Object? iconPath = null,
    Object? type = null,
    Object? devices = null,
    Object? roomMarker = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<MqttDevice>,
      roomMarker: freezed == roomMarker
          ? _value.roomMarker
          : roomMarker // ignore: cast_nullable_to_non_nullable
              as RoomMarker?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomMarkerCopyWith<$Res>? get roomMarker {
    if (_value.roomMarker == null) {
      return null;
    }

    return $RoomMarkerCopyWith<$Res>(_value.roomMarker!, (value) {
      return _then(_value.copyWith(roomMarker: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MqttRoomImplCopyWith<$Res>
    implements $MqttRoomCopyWith<$Res> {
  factory _$$MqttRoomImplCopyWith(
          _$MqttRoomImpl value, $Res Function(_$MqttRoomImpl) then) =
      __$$MqttRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roomId,
      String name,
      String number,
      String topic,
      String iconPath,
      int type,
      List<MqttDevice> devices,
      RoomMarker? roomMarker});

  @override
  $RoomMarkerCopyWith<$Res>? get roomMarker;
}

/// @nodoc
class __$$MqttRoomImplCopyWithImpl<$Res>
    extends _$MqttRoomCopyWithImpl<$Res, _$MqttRoomImpl>
    implements _$$MqttRoomImplCopyWith<$Res> {
  __$$MqttRoomImplCopyWithImpl(
      _$MqttRoomImpl _value, $Res Function(_$MqttRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? name = null,
    Object? number = null,
    Object? topic = null,
    Object? iconPath = null,
    Object? type = null,
    Object? devices = null,
    Object? roomMarker = freezed,
  }) {
    return _then(_$MqttRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<MqttDevice>,
      roomMarker: freezed == roomMarker
          ? _value.roomMarker
          : roomMarker // ignore: cast_nullable_to_non_nullable
              as RoomMarker?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MqttRoomImpl implements _MqttRoom {
  const _$MqttRoomImpl(
      {required this.roomId,
      required this.name,
      required this.number,
      required this.topic,
      required this.iconPath,
      required this.type,
      final List<MqttDevice> devices = const [],
      this.roomMarker})
      : _devices = devices;

  factory _$MqttRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$MqttRoomImplFromJson(json);

  @override
  final int roomId;
  @override
  final String name;
  @override
  final String number;
  @override
  final String topic;
  @override
  final String iconPath;
  @override
  final int type;
  final List<MqttDevice> _devices;
  @override
  @JsonKey()
  List<MqttDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final RoomMarker? roomMarker;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MqttRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.roomMarker, roomMarker) ||
                other.roomMarker == roomMarker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      name,
      number,
      topic,
      iconPath,
      type,
      const DeepCollectionEquality().hash(_devices),
      roomMarker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MqttRoomImplCopyWith<_$MqttRoomImpl> get copyWith =>
      __$$MqttRoomImplCopyWithImpl<_$MqttRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MqttRoomImplToJson(
      this,
    );
  }
}

abstract class _MqttRoom implements MqttRoom {
  const factory _MqttRoom(
      {required final int roomId,
      required final String name,
      required final String number,
      required final String topic,
      required final String iconPath,
      required final int type,
      final List<MqttDevice> devices,
      final RoomMarker? roomMarker}) = _$MqttRoomImpl;

  factory _MqttRoom.fromJson(Map<String, dynamic> json) =
      _$MqttRoomImpl.fromJson;

  @override
  int get roomId;
  @override
  String get name;
  @override
  String get number;
  @override
  String get topic;
  @override
  String get iconPath;
  @override
  int get type;
  @override
  List<MqttDevice> get devices;
  @override
  RoomMarker? get roomMarker;
  @override
  @JsonKey(ignore: true)
  _$$MqttRoomImplCopyWith<_$MqttRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
