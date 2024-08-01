import 'dart:async';
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

typedef ControlFunc = Function(DeviceType type, Map<String, dynamic>);

class CardControlService {
  final StreamSink? _mqttPushMessageSink;
  late final CardControlBuilder _cardControlBuilder;
  MqttRoom? _mqttRoom;

  CardControlService({required MqttRepository? mqttRepository})
      : _mqttPushMessageSink = mqttRepository?.pushSink {
    _cardControlBuilder = CardControlBuilder(controlService: controlService);
  }

  Future<Widget> createNewCardControlWidget(MqttRoom mqr) async {
    _mqttRoom = mqr;
    return _cardControlBuilder.buildControlCard(room: _mqttRoom);
  }

  void controlService(DeviceType deviceType, Map<String, dynamic> action) {
    if (_mqttRoom != null) {
      String message = jsonEncode(action);
      MqttDevice? mqttDevice = _mqttRoom?.devices
          .where((element) => element.type == deviceType.name)
          .firstOrNull;

      if (mqttDevice != null) {
        String topic = buildTopic(
          mqttDevice.topic,
          roomTopic: _mqttRoom!.topic,
        );
        PublishMqttMessage actionMessage =
            PublishMqttMessage(topic: topic, value: message);
        print('Build message for publishing: $actionMessage');
        _mqttPushMessageSink?.add(actionMessage);
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
      String roomName =
          room.number.isNotEmpty ? '${room.name} (${room.number})' : room.name;
      switch (type) {
        case RoomType.workroom:
          return FlexibleWidgetContainer(
            children: [
              OpenSpaceControl2Widget(
                spaceName: roomName,
                onCurtainsSwitch: (p0) {
                  _controlFunc(
                    DeviceType.curtains,
                    CurtainsControl(direction: p0).toJson(),
                  );
                },
                onLightingSwitch: (p0) {
                  _controlFunc(
                    DeviceType.light,
                    LightControl(isOn: p0).toJson(),
                  );
                },
                spaceIconPath:
                    'assets/svg/room_type_icons/1_working_space_on.svg',
              ),
              const ClimateInfoWidget(),
            ],
          );
        case RoomType.meetingroom:
          return FlexibleWidgetContainer(
            children: [
              MeetingControl2Widget(
                spaceName: roomName,
                onBookingSwitch: (p0) {
                  _controlFunc(
                      DeviceType.light, LightControl(isOn: p0).toJson());
                },
                spaceIconPath:
                    'assets/svg/room_type_icons/2_meeting_room_on.svg',
              ),
              const ClimateInfoWidget(),
            ],
          );
        case RoomType.restroom:
          return FlexibleWidgetContainer(
            children: [
              RestSpaceControl2Widget(
                spaceName: roomName,
                spaceIconPath: 'assets/svg/room_type_icons/3_kitchen_on.svg',
                onBookingSwitch: (p0) {
                  _controlFunc(
                      DeviceType.light, LightControl(isOn: p0).toJson());
                },
              ),
              ClimateInfoWidget(),
            ],
          );
        case RoomType.power:
          return FlexibleWidgetContainer(
            children: [
              ElectricalControl2Widget(
                spaceName: roomName,
                spaceIconPath: 'assets/svg/electrosity.svg',
              ),
              EnergyMeterCardWidget(),
            ],
          );
        case RoomType.camera:
          return FlexibleWidgetContainer(
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
