// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'control_card_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ControlCardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CardControlType type, int roomId, String name)
        switchControlCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CardControlType type, int roomId, String name)?
        switchControlCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CardControlType type, int roomId, String name)?
        switchControlCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SwitchControlCard value) switchControlCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SwitchControlCard value)? switchControlCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SwitchControlCard value)? switchControlCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlCardStateCopyWith<$Res> {
  factory $ControlCardStateCopyWith(
          ControlCardState value, $Res Function(ControlCardState) then) =
      _$ControlCardStateCopyWithImpl<$Res, ControlCardState>;
}

/// @nodoc
class _$ControlCardStateCopyWithImpl<$Res, $Val extends ControlCardState>
    implements $ControlCardStateCopyWith<$Res> {
  _$ControlCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ControlCardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ControlCardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CardControlType type, int roomId, String name)
        switchControlCard,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CardControlType type, int roomId, String name)?
        switchControlCard,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CardControlType type, int roomId, String name)?
        switchControlCard,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SwitchControlCard value) switchControlCard,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SwitchControlCard value)? switchControlCard,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SwitchControlCard value)? switchControlCard,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ControlCardState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SwitchControlCardImplCopyWith<$Res> {
  factory _$$SwitchControlCardImplCopyWith(_$SwitchControlCardImpl value,
          $Res Function(_$SwitchControlCardImpl) then) =
      __$$SwitchControlCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardControlType type, int roomId, String name});
}

/// @nodoc
class __$$SwitchControlCardImplCopyWithImpl<$Res>
    extends _$ControlCardStateCopyWithImpl<$Res, _$SwitchControlCardImpl>
    implements _$$SwitchControlCardImplCopyWith<$Res> {
  __$$SwitchControlCardImplCopyWithImpl(_$SwitchControlCardImpl _value,
      $Res Function(_$SwitchControlCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? roomId = null,
    Object? name = null,
  }) {
    return _then(_$SwitchControlCardImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CardControlType,
      null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwitchControlCardImpl implements _SwitchControlCard {
  const _$SwitchControlCardImpl(this.type, this.roomId, this.name);

  @override
  final CardControlType type;
  @override
  final int roomId;
  @override
  final String name;

  @override
  String toString() {
    return 'ControlCardState.switchControlCard(type: $type, roomId: $roomId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchControlCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, roomId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchControlCardImplCopyWith<_$SwitchControlCardImpl> get copyWith =>
      __$$SwitchControlCardImplCopyWithImpl<_$SwitchControlCardImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CardControlType type, int roomId, String name)
        switchControlCard,
  }) {
    return switchControlCard(type, roomId, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CardControlType type, int roomId, String name)?
        switchControlCard,
  }) {
    return switchControlCard?.call(type, roomId, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CardControlType type, int roomId, String name)?
        switchControlCard,
    required TResult orElse(),
  }) {
    if (switchControlCard != null) {
      return switchControlCard(type, roomId, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SwitchControlCard value) switchControlCard,
  }) {
    return switchControlCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SwitchControlCard value)? switchControlCard,
  }) {
    return switchControlCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SwitchControlCard value)? switchControlCard,
    required TResult orElse(),
  }) {
    if (switchControlCard != null) {
      return switchControlCard(this);
    }
    return orElse();
  }
}

abstract class _SwitchControlCard implements ControlCardState {
  const factory _SwitchControlCard(
          final CardControlType type, final int roomId, final String name) =
      _$SwitchControlCardImpl;

  CardControlType get type;
  int get roomId;
  String get name;
  @JsonKey(ignore: true)
  _$$SwitchControlCardImplCopyWith<_$SwitchControlCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
