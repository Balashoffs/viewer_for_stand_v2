part of 'update_card_data_cubit.dart';

@freezed
class UpdateCardDataState with _$UpdateCardDataState {
  const factory UpdateCardDataState.initial() = _Initial;
  const factory UpdateCardDataState.fillClimateCard(ClimateMeter climateMeter, ) = _FillClimateCard;
  const factory UpdateCardDataState.fillPower(EnergyMeter energyMeter, ) = _FillPowerCard;
  const factory UpdateCardDataState.updateControl() = _UpdateControl;
  const factory UpdateCardDataState.waiting() = _Waiting;
}
