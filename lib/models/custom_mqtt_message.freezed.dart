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

CustomMqttMessage _$CustomMqttMessageFromJson(Map<String, dynamic> json) {
  return _CustomMqttMessage.fromJson(json);
}

/// @nodoc
mixin _$CustomMqttMessage {
  String get topic => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomMqttMessageCopyWith<CustomMqttMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomMqttMessageCopyWith<$Res> {
  factory $CustomMqttMessageCopyWith(
          CustomMqttMessage value, $Res Function(CustomMqttMessage) then) =
      _$CustomMqttMessageCopyWithImpl<$Res, CustomMqttMessage>;
  @useResult
  $Res call({String topic, String value});
}

/// @nodoc
class _$CustomMqttMessageCopyWithImpl<$Res, $Val extends CustomMqttMessage>
    implements $CustomMqttMessageCopyWith<$Res> {
  _$CustomMqttMessageCopyWithImpl(this._value, this._then);

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
abstract class _$$CustomMqttMessageImplCopyWith<$Res>
    implements $CustomMqttMessageCopyWith<$Res> {
  factory _$$CustomMqttMessageImplCopyWith(_$CustomMqttMessageImpl value,
          $Res Function(_$CustomMqttMessageImpl) then) =
      __$$CustomMqttMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String value});
}

/// @nodoc
class __$$CustomMqttMessageImplCopyWithImpl<$Res>
    extends _$CustomMqttMessageCopyWithImpl<$Res, _$CustomMqttMessageImpl>
    implements _$$CustomMqttMessageImplCopyWith<$Res> {
  __$$CustomMqttMessageImplCopyWithImpl(_$CustomMqttMessageImpl _value,
      $Res Function(_$CustomMqttMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? value = null,
  }) {
    return _then(_$CustomMqttMessageImpl(
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
class _$CustomMqttMessageImpl implements _CustomMqttMessage {
  const _$CustomMqttMessageImpl({required this.topic, required this.value});

  factory _$CustomMqttMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomMqttMessageImplFromJson(json);

  @override
  final String topic;
  @override
  final String value;

  @override
  String toString() {
    return 'CustomMqttMessage(topic: $topic, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomMqttMessageImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMqttMessageImplCopyWith<_$CustomMqttMessageImpl> get copyWith =>
      __$$CustomMqttMessageImplCopyWithImpl<_$CustomMqttMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomMqttMessageImplToJson(
      this,
    );
  }
}

abstract class _CustomMqttMessage implements CustomMqttMessage {
  const factory _CustomMqttMessage(
      {required final String topic,
      required final String value}) = _$CustomMqttMessageImpl;

  factory _CustomMqttMessage.fromJson(Map<String, dynamic> json) =
      _$CustomMqttMessageImpl.fromJson;

  @override
  String get topic;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$CustomMqttMessageImplCopyWith<_$CustomMqttMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
