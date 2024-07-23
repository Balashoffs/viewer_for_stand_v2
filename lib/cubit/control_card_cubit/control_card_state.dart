part of 'control_card_cubit.dart';

@freezed
class ControlCardState with _$ControlCardState {
  const factory ControlCardState.initial() = _Initial;
  const factory ControlCardState.switchControlCard(CardControlType type, int roomId) = _SwitchControlCard;
}
