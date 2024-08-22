// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_mqtt_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublishMqttMessage _$PublishMqttMessageFromJson(Map<String, dynamic> json) {
  return _PublishMqttMessage.fromJson(json);
}

/// @nodoc
mixin _$PublishMqttMessage {
  String get topic => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishMqttMessageCopyWith<PublishMqttMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishMqttMessageCopyWith<$Res> {
  factory $PublishMqttMessageCopyWith(
          PublishMqttMessage value, $Res Function(PublishMqttMessage) then) =
      _$PublishMqttMessageCopyWithImpl<$Res, PublishMqttMessage>;
  @useResult
  $Res call({String topic, String value});
}

/// @nodoc
class _$PublishMqttMessageCopyWithImpl<$Res, $Val extends PublishMqttMessage>
    implements $PublishMqttMessageCopyWith<$Res> {
  _$PublishMqttMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublishMqttMessageImplCopyWith<$Res>
    implements $PublishMqttMessageCopyWith<$Res> {
  factory _$$PublishMqttMessageImplCopyWith(_$PublishMqttMessageImpl value,
          $Res Function(_$PublishMqttMessageImpl) then) =
      __$$PublishMqttMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String value});
}

/// @nodoc
class __$$PublishMqttMessageImplCopyWithImpl<$Res>
    extends _$PublishMqttMessageCopyWithImpl<$Res, _$PublishMqttMessageImpl>
    implements _$$PublishMqttMessageImplCopyWith<$Res> {
  __$$PublishMqttMessageImplCopyWithImpl(_$PublishMqttMessageImpl _value,
      $Res Function(_$PublishMqttMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? value = null,
  }) {
    return _then(_$PublishMqttMessageImpl(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublishMqttMessageImpl implements _PublishMqttMessage {
  const _$PublishMqttMessageImpl({required this.topic, required this.value});

  factory _$PublishMqttMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublishMqttMessageImplFromJson(json);

  @override
  final String topic;
  @override
  final String value;

  @override
  String toString() {
    return 'PublishMqttMessage(topic: $topic, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishMqttMessageImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishMqttMessageImplCopyWith<_$PublishMqttMessageImpl> get copyWith =>
      __$$PublishMqttMessageImplCopyWithImpl<_$PublishMqttMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublishMqttMessageImplToJson(
      this,
    );
  }
}

abstract class _PublishMqttMessage implements PublishMqttMessage {
  const factory _PublishMqttMessage(
      {required final String topic,
      required final String value}) = _$PublishMqttMessageImpl;

  factory _PublishMqttMessage.fromJson(Map<String, dynamic> json) =
      _$PublishMqttMessageImpl.fromJson;

  @override
  String get topic;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$PublishMqttMessageImplCopyWith<_$PublishMqttMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PollMqttMessage _$PollMqttMessageFromJson(Map<String, dynamic> json) {
  return _PollMqttMessage.fromJson(json);
}

/// @nodoc
mixin _$PollMqttMessage {
  dynamic get topic => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get map => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollMqttMessageCopyWith<PollMqttMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollMqttMessageCopyWith<$Res> {
  factory $PollMqttMessageCopyWith(
          PollMqttMessage value, $Res Function(PollMqttMessage) then) =
      _$PollMqttMessageCopyWithImpl<$Res, PollMqttMessage>;
  @useResult
  $Res call({dynamic topic, DeviceType type, Map<String, dynamic> map});
}

/// @nodoc
class _$PollMqttMessageCopyWithImpl<$Res, $Val extends PollMqttMessage>
    implements $PollMqttMessageCopyWith<$Res> {
  _$PollMqttMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? type = null,
    Object? map = null,
  }) {
    return _then(_value.copyWith(
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollMqttMessageImplCopyWith<$Res>
    implements $PollMqttMessageCopyWith<$Res> {
  factory _$$PollMqttMessageImplCopyWith(_$PollMqttMessageImpl value,
          $Res Function(_$PollMqttMessageImpl) then) =
      __$$PollMqttMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic topic, DeviceType type, Map<String, dynamic> map});
}

/// @nodoc
class __$$PollMqttMessageImplCopyWithImpl<$Res>
    extends _$PollMqttMessageCopyWithImpl<$Res, _$PollMqttMessageImpl>
    implements _$$PollMqttMessageImplCopyWith<$Res> {
  __$$PollMqttMessageImplCopyWithImpl(
      _$PollMqttMessageImpl _value, $Res Function(_$PollMqttMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? type = null,
    Object? map = null,
  }) {
    return _then(_$PollMqttMessageImpl(
      topic: freezed == topic ? _value.topic! : topic,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      map: null == map
          ? _value._map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollMqttMessageImpl implements _PollMqttMessage {
  const _$PollMqttMessageImpl(
      {this.topic = '',
      required this.type,
      required final Map<String, dynamic> map})
      : _map = map;

  factory _$PollMqttMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollMqttMessageImplFromJson(json);

  @override
  @JsonKey()
  final dynamic topic;
  @override
  final DeviceType type;
  final Map<String, dynamic> _map;
  @override
  Map<String, dynamic> get map {
    if (_map is EqualUnmodifiableMapView) return _map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_map);
  }

  @override
  String toString() {
    return 'PollMqttMessage(topic: $topic, type: $type, map: $map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollMqttMessageImpl &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._map, _map));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(topic),
      type,
      const DeepCollectionEquality().hash(_map));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollMqttMessageImplCopyWith<_$PollMqttMessageImpl> get copyWith =>
      __$$PollMqttMessageImplCopyWithImpl<_$PollMqttMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollMqttMessageImplToJson(
      this,
    );
  }
}

abstract class _PollMqttMessage implements PollMqttMessage {
  const factory _PollMqttMessage(
      {final dynamic topic,
      required final DeviceType type,
      required final Map<String, dynamic> map}) = _$PollMqttMessageImpl;

  factory _PollMqttMessage.fromJson(Map<String, dynamic> json) =
      _$PollMqttMessageImpl.fromJson;

  @override
  dynamic get topic;
  @override
  DeviceType get type;
  @override
  Map<String, dynamic> get map;
  @override
  @JsonKey(ignore: true)
  _$$PollMqttMessageImplCopyWith<_$PollMqttMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
