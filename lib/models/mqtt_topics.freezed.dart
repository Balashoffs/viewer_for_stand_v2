// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_topics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MqttTopics _$MqttTopicsFromJson(Map<String, dynamic> json) {
  return _MqttTopics.fromJson(json);
}

/// @nodoc
mixin _$MqttTopics {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MqttTopicsCopyWith<MqttTopics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MqttTopicsCopyWith<$Res> {
  factory $MqttTopicsCopyWith(
          MqttTopics value, $Res Function(MqttTopics) then) =
      _$MqttTopicsCopyWithImpl<$Res, MqttTopics>;
  @useResult
  $Res call({int id, String name, String topic});
}

/// @nodoc
class _$MqttTopicsCopyWithImpl<$Res, $Val extends MqttTopics>
    implements $MqttTopicsCopyWith<$Res> {
  _$MqttTopicsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? topic = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MqttTopicsImplCopyWith<$Res>
    implements $MqttTopicsCopyWith<$Res> {
  factory _$$MqttTopicsImplCopyWith(
          _$MqttTopicsImpl value, $Res Function(_$MqttTopicsImpl) then) =
      __$$MqttTopicsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String topic});
}

/// @nodoc
class __$$MqttTopicsImplCopyWithImpl<$Res>
    extends _$MqttTopicsCopyWithImpl<$Res, _$MqttTopicsImpl>
    implements _$$MqttTopicsImplCopyWith<$Res> {
  __$$MqttTopicsImplCopyWithImpl(
      _$MqttTopicsImpl _value, $Res Function(_$MqttTopicsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? topic = null,
  }) {
    return _then(_$MqttTopicsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MqttTopicsImpl implements _MqttTopics {
  const _$MqttTopicsImpl(
      {required this.id, required this.name, this.topic = ''});

  factory _$MqttTopicsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MqttTopicsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String topic;

  @override
  String toString() {
    return 'MqttTopics(id: $id, name: $name, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MqttTopicsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, topic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MqttTopicsImplCopyWith<_$MqttTopicsImpl> get copyWith =>
      __$$MqttTopicsImplCopyWithImpl<_$MqttTopicsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MqttTopicsImplToJson(
      this,
    );
  }
}

abstract class _MqttTopics implements MqttTopics {
  const factory _MqttTopics(
      {required final int id,
      required final String name,
      final String topic}) = _$MqttTopicsImpl;

  factory _MqttTopics.fromJson(Map<String, dynamic> json) =
      _$MqttTopicsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get topic;
  @override
  @JsonKey(ignore: true)
  _$$MqttTopicsImplCopyWith<_$MqttTopicsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
