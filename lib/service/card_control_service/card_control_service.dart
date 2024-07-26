import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/model/card_control_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/viewer_mqqt_message.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/control_card/control_cards.dart';
import 'package:viewer_for_stand_v2/widget/custom/flexible_widget_container.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';

typedef ControlFunc = Function(String deviceId, Map<String, dynamic>);

class CardControlService {
  final MqttRepository _mqttRepository;
  late final CardControlBuilder _cardControlBuilder;
  MqttRoom? _mqttRoom;

  CardControlService({required MqttRepository mqttRepository})
      : _mqttRepository = mqttRepository {
    _cardControlBuilder = CardControlBuilder(controlService: controlService);
  }

  Future<void> disableCardControlWidget() async {
    _mqttRoom?.devices.map((e) => e.topic).forEach((topic) {
      _mqttRepository.unSubscribe(topic);
    });
    _mqttRoom = null;
  }

  Future<Widget> createNewCardControlWidget(MqttRoom mqr) async {
    if (!_mqttRepository.initFlag) {
      await _mqttRepository.init();
    }
    if (_mqttRoom != null) {
      await disableCardControlWidget();
    }
    _mqttRoom = mqr;
    _mqttRoom?.devices.map((e) => e.topic).forEach((topic) {
      _mqttRepository.subscribe(topic);
    });
    CardControlType type = CardControlType.findByPos(mqr.type);
    return _cardControlBuilder.buildControlCard(
      roomId: mqr.roomId,
      type: type,
      roomName: '${mqr.name} (${mqr.number})',
    );
  }

  void controlService(String deviceId, Map<String, dynamic> action) {
    if (_mqttRoom != null) {
      String message = jsonEncode(action);
      MqttDevice? mqttDevice = _mqttRoom?.devices
          .where((element) => element.uuid == deviceId)
          .firstOrNull;
      if (mqttDevice != null) {
        ActionMessage actionMessage =
            ActionMessage(topic: deviceId, value: message);
        _mqttRepository.sink.add(actionMessage);
      }
    }
  }
}

class CardControlBuilder {
  final ControlFunc _controlFunc;

  CardControlBuilder({required ControlFunc controlService})
      : _controlFunc = controlService;

  Widget buildControlCard({
    required CardControlType type,
    required int roomId,
    required String roomName,
  }) {
    {
      switch (type) {
        case CardControlType.workroom:
          return FlexibleWidgetContainer(children: [
            OpenSpaceControl2Widget(
              spaceName: roomName,
              onCurtainsSwitch: (p0) {
                _controlFunc('', {});
              },
              onLightingSwitch: (p0) {
                _controlFunc('', {});
              },
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
                onBookingSwitch: (p0) {
                  _controlFunc('', {});
                },
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
              onBookingSwitch: (bool) {
                _controlFunc('', {});
              },
            ),
            ClimateInfoWidget(),
          ]);
        case CardControlType.power:
          return const FlexibleWidgetContainer(
            children: [EnergyMeterCardWidget()],
          );
        case CardControlType.camera:
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
