import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state_data.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/card_control_service/card_control_service.dart';

part 'control_card_state.dart';

part 'control_card_cubit.freezed.dart';

class ControlCardCubit extends Cubit<ControlCardState> {
  final Stream<RoomStateData> _roomStateDataStream;
  final CardControlService _cardControlService;

  ControlCardCubit({
    required RoomRepository roomRepository,
    required CardControlService cardControlService,
  })  : _roomStateDataStream = roomRepository.getPostRoomStream,
        _cardControlService = cardControlService,
        super(
          const ControlCardState.initial(),
        ) {
    _roomStateDataStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(RoomStateData roomStateData) async {
    if (roomStateData.state == RoomState.init) {
      emit(const ControlCardState.initial());
    } else {
      if (roomStateData.currentRoom != null) {
        Widget widget = await _cardControlService
            .createNewCardControlWidget(roomStateData.currentRoom!);
        emit(ControlCardState.showControlCard(widget));
      }
    }
  }
}
