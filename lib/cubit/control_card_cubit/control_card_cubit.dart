import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/model/device.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/control_card/control_cards.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';

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
    Widget widget = buildControlCard(roomId: -1);
    emit(ControlCardState.showControlCard(widget));
  }

  final ViewerRepository viewerRepository;

  int _lastRoomId = -1;

  Future<void> selectDevice(Device device) async {
    if (_lastRoomId == device.roomId) {
      _lastRoomId = -1;
    } else {
      _lastRoomId = device.roomId;
    }

    CardControlType type = CardControlType.findByPos(device.roomType);
    Widget widget = buildControlCard(
        type: type, roomId: _lastRoomId, roomName: device.roomName);
    emit(ControlCardState.showControlCard(widget));
  }

  Widget buildControlCard({
    CardControlType type = CardControlType.undef,
    required int roomId,
    String roomName = '',}) {
    if (roomId == -1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SecuritySettingsWidget(),
          ElectricitySupplyWidget(),
        ],
      );
    }
    {
      switch (type) {
        case CardControlType.workroom:
          return Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  OpenSpaceControl2Widget(
                    spaceName: roomName,
                    onCurtainsSwitch: (p0) {},
                    onLightingSwitch: (p0) {},
                    spaceIconPath:
                    'assets/svg/room_type_icons/1_working_space_on.svg',
                  ),
                  ClimateInfoWidget(),
                ],
              ),
            ),
            // fit: FlexFit.loose,
          );
        case CardControlType.meetingroom:
          return Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MeetingControl2Widget(
                    spaceName: roomName,
                    spaceIconPath:
                    'assets/svg/room_type_icons/2_meeting_room_on.svg',
                    onBookingSwitch: (bool) {},
                  ),
                  ClimateInfoWidget(),
                ],
              ),
            ),
            // fit: FlexFit.loose,
          );
        case CardControlType.restroom:
          return Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RestSpaceControl2Widget(
                    spaceName: roomName,
                    spaceIconPath:
                    'assets/svg/room_type_icons/3_kitchen_on.svg',
                    onBookingSwitch: (bool) {},
                  ),
                  ClimateInfoWidget(),
                ],
              ),
            ),
            // fit: FlexFit.loose,
          );
        default:
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SecuritySettingsWidget(),
              ElectricitySupplyWidget(),
            ],
          );
      }
    };
  }
}


