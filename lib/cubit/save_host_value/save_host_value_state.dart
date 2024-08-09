part of 'save_host_value_cubit.dart';

@freezed
class SaveHostValueState with _$SaveHostValueState {
  const factory SaveHostValueState.initial() = _Initial;
  const factory SaveHostValueState.onEnter() = _OnEnter;
  const factory SaveHostValueState.onSave(String host, int port) = _OnSave;
}
