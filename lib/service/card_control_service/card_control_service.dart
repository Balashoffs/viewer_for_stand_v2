import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/curtains.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/light.dart';
import 'package:viewer_for_stand_v2/models/room/room_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/room_switch_state_value.dart';
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
        _mqttPushMessageSink?.add(actionMessage);
      }
    }
  }

  void onCloseControl(int id) {
    var body = {'id': id};
    MessageMV messageMV = MessageMV.toMessage(
        typeMV: MessageTypeMV.postDisableMarkMV, body: body);
    _onPostMessageSink?.add(messageMV.message);
  }
}

class CardControlBuilder {
  final ControlFunc _controlFunc;
  final CloseFunc _closeFunc;
  late RoomSwitchStateValue stateValue;

  CardControlBuilder({
    required ControlFunc controlFunc,
    required CloseFunc closeFunc,
  })  : _controlFunc = controlFunc,
        _closeFunc = closeFunc;

  Future<Widget> buildControlCard({
    required MqttRoom? room,
  }) async {
    if (room != null) {
      RoomType type = RoomType.findByPos(room.type);
      String roomName =
          room.number.isNotEmpty ? '${room.name} (${room.number})' : room.name;
      stateValue = await getValue(roomName);
      switch (type) {
        case RoomType.workroom:
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
                OfficeRoomControlWidget(
                  stateValue: stateValue,
                  onPress: (p0) {
                    stateValue = stateValue.copyWith(isOnCurtains: p0);
                    setValue(roomName, stateValue);
                    _controlFunc(
                      DeviceType.curtains,
                      CurtainsControl(direction: p0).toJson(),
                    );
                  },
                  onSwitch: (p0) {
                    stateValue = stateValue.copyWith(isOnLight: p0);
                    setValue(roomName, stateValue);
                    _controlFunc(
                      DeviceType.light,
                      LightControl(state: p0 ? 1 : 0).toJson(),
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
                  stateValue: stateValue,
                  onSwitch: (p0) {
                    stateValue = stateValue.copyWith(isOnLight: p0);
                    setValue(roomName, stateValue);
                    _controlFunc(
                      DeviceType.light,
                      LightControl(state: p0 ? 1 : 0).toJson(),
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
                onSwitch: (p0) {
                  stateValue = stateValue.copyWith(isOnCamera: p0);
                  setValue(roomName, stateValue);
                },
                isOn: stateValue.isOnCamera,
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

  Future<RoomSwitchStateValue> getValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? json = sp.getString(key);
    if (json != null) {
      return RoomSwitchStateValue.fromJson(jsonDecode(json));
    }
    return RoomSwitchStateValue();
  }

  void setValue(String key, RoomSwitchStateValue stateValue) async {
    String json = jsonEncode(stateValue.toJson());
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, json);
  }
}
