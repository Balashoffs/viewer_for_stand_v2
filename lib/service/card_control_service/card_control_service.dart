import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/curtains.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/light.dart';
import 'package:viewer_for_stand_v2/models/room/room_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';
import 'package:viewer_for_stand_v2/util/mqqt_topic_convertor.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/control_card/control_cards.dart';
import 'package:viewer_for_stand_v2/widget/custom/flexible_widget_container.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';

typedef ControlFunc = Function(String deviceId, Map<String, dynamic>);

class CardControlService {
  final MqttRepository? _mqttRepository;
  late final CardControlBuilder _cardControlBuilder;
  MqttRoom? _mqttRoom;

  CardControlService({required MqttRepository? mqttRepository})
      : _mqttRepository = mqttRepository {
    _cardControlBuilder = CardControlBuilder(controlService: controlService);
  }

  Future<void> disableCardControlWidget() async {
    _mqttRoom?.devices.map((e) => e.topic).forEach((topic) {
      _mqttRepository?.unSubscribe(topic);
    });
    _mqttRoom = null;
  }

  Future<Widget> createNewCardControlWidget(MqttRoom mqr) async {
    if (_mqttRepository != null) {
      if (!_mqttRepository.initFlag) {
        await _mqttRepository.init();
      }
    }
    if (_mqttRoom?.roomId == mqr.roomId) {
      await disableCardControlWidget();
    }
    _mqttRoom = mqr;
    _mqttRoom?.devices.map((e) => e.topic).forEach((topic) {
      _mqttRepository?.subscribe(topic);
    });

    return _cardControlBuilder.buildControlCard(room: _mqttRoom);
  }

  void controlService(String deviceTopic, Map<String, dynamic> action) {
    if (_mqttRoom != null) {
      String message = jsonEncode(action);
      MqttDevice? mqttDevice = _mqttRoom?.devices
          .where((element) => element.type == deviceTopic)
          .firstOrNull;
      if (mqttDevice != null) {
        String topic = buildTopic(_mqttRoom!.topic, deviceTopic);
        CustomMqttMessage actionMessage =
            CustomMqttMessage(topic: topic, value: message);
        _mqttRepository?.sink.add(actionMessage);
      }
    }
  }
}

class CardControlBuilder {
  final ControlFunc _controlFunc;

  CardControlBuilder({required ControlFunc controlService})
      : _controlFunc = controlService;

  Widget buildControlCard({
    required MqttRoom? room,
  }) {
    if (room != null) {
      RoomType type = RoomType.findByPos(room.type);
      String roomName = room.number.isNotEmpty ? '${room.name} (${room.number})' : room.name;
      switch (type) {
        case RoomType.workroom:
          return FlexibleWidgetContainer(children: [
            OpenSpaceControl2Widget(
              spaceName: roomName,
              onCurtainsSwitch: (p0) {
                String? topic = findByType(room, DeviceType.curtains);
                if (topic != null) {
                  _controlFunc(topic, CurtainsControl(direction: p0).toJson());
                }
              },
              onLightingSwitch: (p0) {
                String? topic = findByType(room, DeviceType.light);
                if (topic != null) {
                  _controlFunc(topic, LightControl(isOn: p0).toJson());
                }
              },
              spaceIconPath:
                  'assets/svg/room_type_icons/1_working_space_on.svg',
            ),
            const ClimateInfoWidget(),
          ]);
        case RoomType.meetingroom:
          return FlexibleWidgetContainer(
            children: [
              MeetingControl2Widget(
                spaceName: roomName,
                onBookingSwitch: (p0) {
                  String? topic = findByType(room, DeviceType.light);
                  if (topic != null) {
                    _controlFunc(topic, LightControl(isOn: p0).toJson());
                  }
                },
                spaceIconPath:
                    'assets/svg/room_type_icons/1_working_space_on.svg',
              ),
              const ClimateInfoWidget(),
            ],
          );
        case RoomType.restroom:
          return FlexibleWidgetContainer(children: [
            RestSpaceControl2Widget(
              spaceName: roomName,
              spaceIconPath: 'assets/svg/room_type_icons/3_kitchen_on.svg',
              onBookingSwitch: (p0) {
                String? topic = findByType(room, DeviceType.light);
                if (topic != null) {
                  _controlFunc(topic, LightControl(isOn: p0).toJson());
                }
              },
            ),
            ClimateInfoWidget(),
          ]);
        case RoomType.power:
          return FlexibleWidgetContainer(
            children: [
              ElectricalControl2Widget(
                spaceName: roomName,
                spaceIconPath: 'assets/svg/electrosity.svg',
              ),
              EnergyMeterCardWidget()
            ],
          );
        case RoomType.camera:
          return  FlexibleWidgetContainer(
            children: [
              ElectricalControl2Widget(
                spaceName: roomName,
                spaceIconPath: 'assets/svg/camera.svg',
              ),
              SecuritySettingsWidget(),
            ],
          );
        default:
          break;
      }
    }
    return SizedBox.shrink();
  }
}
