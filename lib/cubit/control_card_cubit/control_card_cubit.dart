import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';
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
  ControlCardCubit({
    required ViewerRepository viewerRepository,
    required RoomRepository roomRepository,
    required CardControlService cardControlService,
  })  : _viewerRepository = viewerRepository,
        _roomRepository = roomRepository,
        _cardControlService = cardControlService,
        super(
          const ControlCardState.initial(),
        ) {
    _viewerRepository.postCardStream.listen(_streamHandler);
  }

  final ViewerRepository _viewerRepository;
  final RoomRepository _roomRepository;
  final CardControlService _cardControlService;

  int _lastRoomId = -1;

  void _streamHandler(MessageAsMap event) async {
    Map<String, Object> message = Map.from(event);
    MessageTypeMV type = MessageTypeMV.findBy(message['type'] as String);
    if (type == MessageTypeMV.postSelectMarkVM) {
      String json = message['body'] as String;
      int roomId = jsonDecode(json)['roomId'] ?? -1;
      if (roomId != -1) {
        await selectingRoom(roomId);
      }
    }
  }

  Future<void> selectingRoom(int roomId) async {
    MqttRoom? mqr = _roomRepository.getRoom(roomId);
    if (mqr != null) {
      if (_lastRoomId == roomId) {
        emit(const ControlCardState.initial());
        _lastRoomId = -1;
        _cardControlService.disableCardControlWidget();
      } else {
        _lastRoomId = roomId;
        Widget widget =
            await _cardControlService.createNewCardControlWidget(mqr);
        emit(ControlCardState.showControlCard(widget));
      }
    }
  }
}
