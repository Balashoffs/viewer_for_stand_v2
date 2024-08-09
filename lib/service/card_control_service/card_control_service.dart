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
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';
import 'package:viewer_for_stand_v2/widget/three/custom_body_widget.dart';
import 'package:viewer_for_stand_v2/widget/three/custom_card_widget.dart';
import 'package:viewer_for_stand_v2/widget/three/head_widget.dart';

typedef ControlFunc = Function(DeviceType type, Map<String, dynamic>);
typedef CloseFunc = Function(int id);

class CardControlService {
  final StreamSink<PublishMqttMessage>? _mqttPushMessageSink;
  final StreamSink<MessageAsMap>? _onPostMessageSink;
  late final CardControlBuilder _cardControlBuilder;

  MqttRoom? _mqttRoom;

  CardControlService({
    required MqttRepository? mqttRepository,
    required ViewerRepository? viewerRepository,
  })  : _mqttPushMessageSink = mqttRepository?.pushSink,
        _onPostMessageSink = viewerRepository?.postViewerSinkStream {
    _cardControlBuilder = CardControlBuilder(
      controlFunc: onPostControl,
      closeFunc: onCloseControl,
    );
  }

  Future<Widget> createNewCardControlWidget(MqttRoom mqr) async {
    _mqttRoom = mqr;
    return _cardControlBuilder.buildControlCard(room: _mqttRoom);
  }

  void onPostControl(DeviceType deviceType, Map<String, dynamic> action) {
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

  void onCloseControl(int id) {
    print('onCloseControl: $id');
    var body = {'id':id};
    MessageMV messageMV = MessageMV.toMessage(
        typeMV: MessageTypeMV.postDisableMarkMV, body: body);
    _onPostMessageSink?.add(messageMV.message);
  }
}

class CardControlBuilder {
  final ControlFunc _controlFunc;
  final CloseFunc _closeFunc;

  CardControlBuilder({
    required ControlFunc controlFunc,
    required CloseFunc closeFunc,
  })  : _controlFunc = controlFunc,
        _closeFunc = closeFunc;

  Widget buildControlCard({
    required MqttRoom? room,
  }) {
    if (room != null) {
      RoomType type = RoomType.findByPos(room.type);
      String roomName =
          room.number.isNotEmpty ? '${room.name} (${room.number})' : room.name;
      switch (type) {
        case RoomType.workroom:
          return CustomSpaceCardWidget(
            head: Builder(builder: (context) {
              return HeadWithButton(
                text: roomName,
                id: room.roomId,
                iconPath: room.iconPath,
                onCLose: _closeFunc,
              );
            }),
            body: Column(
              children: [
                const CustomDivider(),
                OfficeRoomControlWidget(
                  buttonNotifier: (p0) {
                    _controlFunc(
                      DeviceType.curtains,
                      CurtainsControl(direction: p0).toJson(),
                    );
                  },
                  onSwitch: (p0) {
                    _controlFunc(
                      DeviceType.light,
                      LightControl(isOn: p0).toJson(),
                    );
                  },
                ),
                const CustomDivider(),
                const ClimateValuesWidget(),
                const CustomDivider(),
              ],
            ),
          );
        case RoomType.meetingroom:
        case RoomType.restroom:
          return CustomSpaceCardWidget(
            head: HeadWithButton(
              text: roomName,
              id: room.roomId,
              iconPath: room.iconPath,
              onCLose: _closeFunc,
            ),
            body: Column(
              children: [
                const CustomDivider(),
                MeetingRoomControlWidget(
                  onSwitch: (p0) {
                    _controlFunc(
                      DeviceType.light,
                      LightControl(isOn: p0).toJson(),
                    );
                  },
                ),
                const CustomDivider(),
                const ClimateValuesWidget(),
                const CustomDivider(),
              ],
            ),
          );
        case RoomType.power:
          return CustomCardWidget(
            children: [
              HeadWidget(
                text: roomName,
              ),
              const EnergyMeterDataWidget(),
              const CustomDivider(),
              CustomBodyWriteSwitchWidget(
                name: 'Видеонаблюдение',
                iconPath: 'assets/svg/viewer_control/camera.svg',
                onSwitch: (p0) {},
              ),
              const CustomDivider(),
            ],
          );
        default:
          break;
      }
    }
    return const SizedBox.shrink();
  }
}
