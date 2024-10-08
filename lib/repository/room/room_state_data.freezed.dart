// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomStateData {
  MqttRoom? get lastRoom => throw _privateConstructorUsedError;
  MqttRoom? get currentRoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStateDataCopyWith<RoomStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateDataCopyWith<$Res> {
  factory $RoomStateDataCopyWith(
          RoomStateData value, $Res Function(RoomStateData) then) =
      _$RoomStateDataCopyWithImpl<$Res, RoomStateData>;
  @useResult
  $Res call({MqttRoom? lastRoom, MqttRoom? currentRoom});

  $MqttRoomCopyWith<$Res>? get lastRoom;
  $MqttRoomCopyWith<$Res>? get currentRoom;
}

/// @nodoc
class _$RoomStateDataCopyWithImpl<$Res, $Val extends RoomStateData>
    implements $RoomStateDataCopyWith<$Res> {
  _$RoomStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRoom = freezed,
    Object? currentRoom = freezed,
  }) {
    return _then(_value.copyWith(
      lastRoom: freezed == lastRoom
          ? _value.lastRoom
          : lastRoom // ignore: cast_nullable_to_non_nullable
              as MqttRoom?,
      currentRoom: freezed == currentRoom
          ? _value.currentRoom
          : currentRoom // ignore: cast_nullable_to_non_nullable
              as MqttRoom?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MqttRoomCopyWith<$Res>? get lastRoom {
    if (_value.lastRoom == null) {
      return null;
    }

    return $MqttRoomCopyWith<$Res>(_value.lastRoom!, (value) {
      return _then(_value.copyWith(lastRoom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MqttRoomCopyWith<$Res>? get currentRoom {
    if (_value.currentRoom == null) {
      return null;
    }

    return $MqttRoomCopyWith<$Res>(_value.currentRoom!, (value) {
      return _then(_value.copyWith(currentRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomStateDataImplCopyWith<$Res>
    implements $RoomStateDataCopyWith<$Res> {
  factory _$$RoomStateDataImplCopyWith(
          _$RoomStateDataImpl value, $Res Function(_$RoomStateDataImpl) then) =
      __$$RoomStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MqttRoom? lastRoom, MqttRoom? currentRoom});

  @override
  $MqttRoomCopyWith<$Res>? get lastRoom;
  @override
  $MqttRoomCopyWith<$Res>? get currentRoom;
}

/// @nodoc
class __$$RoomStateDataImplCopyWithImpl<$Res>
    extends _$RoomStateDataCopyWithImpl<$Res, _$RoomStateDataImpl>
    implements _$$RoomStateDataImplCopyWith<$Res> {
  __$$RoomStateDataImplCopyWithImpl(
      _$RoomStateDataImpl _value, $Res Function(_$RoomStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastRoom = freezed,
    Object? currentRoom = freezed,
  }) {
    return _then(_$RoomStateDataImpl(
      lastRoom: freezed == lastRoom
          ? _value.lastRoom
          : lastRoom // ignore: cast_nullable_to_non_nullable
              as MqttRoom?,
      currentRoom: freezed == currentRoom
          ? _value.currentRoom
          : currentRoom // ignore: cast_nullable_to_non_nullable
              as MqttRoom?,
    ));
  }
}

/// @nodoc

class _$RoomStateDataImpl implements _RoomStateData {
  _$RoomStateDataImpl({this.lastRoom, this.currentRoom});

  @override
  final MqttRoom? lastRoom;
  @override
  final MqttRoom? currentRoom;

  @override
  String toString() {
    return 'RoomStateData(lastRoom: $lastRoom, currentRoom: $currentRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStateDataImpl &&
            (identical(other.lastRoom, lastRoom) ||
                other.lastRoom == lastRoom) &&
            (identical(other.currentRoom, currentRoom) ||
                other.currentRoom == currentRoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastRoom, currentRoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStateDataImplCopyWith<_$RoomStateDataImpl> get copyWith =>
      __$$RoomStateDataImplCopyWithImpl<_$RoomStateDataImpl>(this, _$identity);
}

abstract class _RoomStateData implements RoomStateData {
  factory _RoomStateData(
      {final MqttRoom? lastRoom,
      final MqttRoom? currentRoom}) = _$RoomStateDataImpl;

  @override
  MqttRoom? get lastRoom;
  @override
  MqttRoom? get currentRoom;
  @override
  @JsonKey(ignore: true)
  _$$RoomStateDataImplCopyWith<_$RoomStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
