import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/model/device.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';

part 'control_card_state.dart';
part 'control_card_cubit.freezed.dart';

class ControlCardCubit extends Cubit<ControlCardState> {
  ControlCardCubit({required this.viewerRepository})
      : super(const ControlCardState.initial()) {
    viewerRepository.postCardStream.listen((event) {
      Map<String, Object> message = Map.from(event);
      MessageTypeMV type = MessageTypeMV.findBy(message['type'] as String);
      if (type == MessageTypeMV.postSelectMarkVM) {
        String json = message['body'] as String;
        Device device = Device.fromJson(jsonDecode(json));
        selectDevice(device);
      }
    });
  }

  final ViewerRepository viewerRepository;

  int _lastRoomId = -1;

  Future<void> selectDevice(Device device) async {
    if (_lastRoomId == device.roomId) {
      _lastRoomId = -1;
      emit(const ControlCardState.initial());
    } else {
      _lastRoomId = device.roomId;
      CardControlType type = CardControlType.findByPos(device.roomType);
      emit(ControlCardState.switchControlCard(type, device.roomId, device.roomName));
    }
  }
}
