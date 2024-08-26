import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/models/room/room_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/control/control_state.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/three/custom_body_widget.dart';
import 'package:viewer_for_stand_v2/widget/three/custom_card_widget.dart';
import 'package:viewer_for_stand_v2/widget/three/head_widget.dart';

mixin CardControlBuilder {
  Widget buildControlCard({
    required MqttRoom? room,
    required List<ControlStateChanger> changers,
  }){
    if (room != null) {
      RoomType type = RoomType.findByPos(room.type);
      String roomName =
          room.number.isNotEmpty ? '${room.name} (${room.number})' : room.name;
      switch (type) {
        case RoomType.workroom:
        case RoomType.meetingroom:
        case RoomType.restroom:
          return CustomSpaceCardWidget(
            head: HeadWithButton(
              text: roomName,
              id: room.roomId,
              iconPath: room.iconPath,
            ),
            body: Column(
              children: [
                const CustomDivider(),
                CustomRoomControlWidget(changers: changers,),
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
              // CustomBodyWriteSwitchWidget(
              //   name: 'Видеонаблюдение',
              //   iconPath: 'assets/svg/viewer_control/camera.svg',
              // ),
              // const CustomDivider(),
            ],
          );
        default:
          break;
      }
    }
    return const SizedBox.shrink();
  }
}
