import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
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
    required Size size,
  })  : _viewerRepository = viewerRepository,
        _roomRepository = roomRepository,
        _size = size,
        super(const ControlCardState.initial()) {
    _viewerRepository.postCardStream.listen(_streamHandler);
  }

  final ViewerRepository _viewerRepository;
  final RoomRepository _roomRepository;
  final Size _size;

  int _lastRoomId = -1;

  void _streamHandler(MessageAsMap event) {
    Map<String, Object> message = Map.from(event);
    MessageTypeMV type = MessageTypeMV.findBy(message['type'] as String);
    if (type == MessageTypeMV.postSelectMarkVM) {
      String json = message['body'] as String;
      int roomId = jsonDecode(json)['roomId'] ?? -1;
      if (roomId != -1) {
        selectDevice(roomId);
      }
    }
  }

  Future<void> selectDevice(int roomId) async {
    if (_lastRoomId == roomId) {
      _lastRoomId = -1;
      emit(ControlCardState.initial());
    } else {
      _lastRoomId = roomId;
      MqttRoom? mqr = _roomRepository.getRoom(roomId);
      if (mqr != null) {
        CardControlType type = CardControlType.findByPos(mqr.type);
        Widget widget = buildControlCard(
            type: type,
            roomId: _lastRoomId,
            roomName: '${mqr.name} (${mqr.number})');
        emit(ControlCardState.showControlCard(widget));
      }
    }
  }

  Widget buildControlCard({
    CardControlType type = CardControlType.undef,
    required int roomId,
    String roomName = '',
  }) {
    {
      switch (type) {
        case CardControlType.workroom:
          return FlexibleWidgetContainer(children: [
            OpenSpaceControl2Widget(
              spaceName: roomName,
              onCurtainsSwitch: (p0) {},
              onLightingSwitch: (p0) {},
              spaceIconPath:
                  'assets/svg/room_type_icons/1_working_space_on.svg',
            ),
            ClimateInfoWidget(),
          ]);
        case CardControlType.meetingroom:
          return FlexibleWidgetContainer(
            children: [
              MeetingControl2Widget(
                spaceName: roomName,
                onBookingSwitch: (p0) {},
                spaceIconPath:
                    'assets/svg/room_type_icons/1_working_space_on.svg',
              ),
              ClimateInfoWidget(),
            ],
          );
        case CardControlType.restroom:
          return FlexibleWidgetContainer(children: [
            RestSpaceControl2Widget(
              spaceName: roomName,
              spaceIconPath: 'assets/svg/room_type_icons/3_kitchen_on.svg',
              onBookingSwitch: (bool) {},
            ),
            ClimateInfoWidget(),
          ]);
        case CardControlType.power:
          return FlexibleWidgetContainer(
            children: [ElectricitySupplyWidget()],
          );
        case CardControlType.camer:
          return const FlexibleWidgetContainer(
            children: [
              SecuritySettingsWidget(),
            ],
          );
        default:
          return SizedBox.shrink();
      }
    }
  }
}

class FlexibleWidgetContainer extends StatelessWidget {
  const FlexibleWidgetContainer({
    super.key,
    this.flex = 6,
    required this.children,
  });

  final int flex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children,
        ),
      ),
      // fit: FlexFit.loose,
    );
  }
}
