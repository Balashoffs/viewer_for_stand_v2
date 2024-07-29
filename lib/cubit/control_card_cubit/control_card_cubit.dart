import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/room/room_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/card_control_service/card_control_service.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/control_card/control_cards.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';

part 'control_card_state.dart';

part 'control_card_cubit.freezed.dart';

class ControlCardCubit extends Cubit<ControlCardState> {
  final RoomRepository _roomRepository;
  final CardControlService _cardControlService;

  ControlCardCubit({
    required RoomRepository roomRepository,
    required CardControlService cardControlService,
  })  : _roomRepository = roomRepository,
        _cardControlService = cardControlService,
        super(
          const ControlCardState.initial(),
        ) {
    _roomRepository.getPostRoomStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(MqttRoom room) async {
    if (_roomRepository.lastRoomId == -1) {
      emit(const ControlCardState.initial());
      _cardControlService.disableCardControlWidget();
    } else {
      Widget widget =
          await _cardControlService.createNewCardControlWidget(room);
      emit(ControlCardState.showControlCard(widget));
    }
  }
}
