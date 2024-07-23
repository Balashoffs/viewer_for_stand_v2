import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/model/device.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';

part 'control_card_state.dart';

part 'control_card_cubit.freezed.dart';

class ControlCardCubit extends Cubit<ControlCardState> {
  ControlCardCubit() : super(const ControlCardState.initial());

  int _lastRoomId = -1;

  Future<void> selectDevice(Device device) async {
    if (_lastRoomId == device.roomId) {
      _lastRoomId = -1;
      emit(const ControlCardState.initial());
    } else {
      _lastRoomId = device.roomId;
      CardControlType type = CardControlType.findBy(device.roomType);
      emit(ControlCardState.switchControlCard(type, device.roomId));
    }
  }
}
