import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/cubit/control_card_cubit/card_control_builder.dart';
import 'package:viewer_for_stand_v2/repository/control/control_state.dart';
import 'package:viewer_for_stand_v2/repository/controls_state_repository.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state_data.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';

part 'control_card_state.dart';

part 'control_card_cubit.freezed.dart';

class ControlCardCubit extends Cubit<ControlCardState> with CardControlBuilder {
  final Stream<RoomStateData> _roomStateDataStream;
  final ControlStateRepository _controlStateRepository;

  ControlCardCubit({
    required RoomRepository roomRepository,
    required ControlStateRepository controlStateRepository,
  })
      : _roomStateDataStream = roomRepository.getPostRoomStream,
        _controlStateRepository = controlStateRepository,
        super(
        const ControlCardState.initial(),
      ) {
    _roomStateDataStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(RoomStateData roomStateData) async {
    emit(const ControlCardState.loading());
    if (roomStateData.currentRoom != null) {
      await Future.delayed(const Duration(milliseconds: 100));
      List<ControlStateChanger> changers = _controlStateRepository
          .getControlStateBy(roomStateData.currentRoom!.roomId);
      Widget widget = buildControlCard(room: roomStateData.currentRoom!, changers: changers);
      emit(ControlCardState.showControlCard(widget));
    }
  }
}
