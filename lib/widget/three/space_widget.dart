import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';

import 'custom_body_widget.dart';
import 'custom_card_widget.dart';
import 'data.dart';
import 'head_widget.dart';

class OfficeSpaceWidget extends StatelessWidget {
  const OfficeSpaceWidget({
    super.key,
    required this.name,
    required this.iconPath,
    required this.data,
  });

  final String name;
  final String iconPath;
  final SpaceModel data;

  @override
  Widget build(BuildContext context) {
    return CustomSpaceCardWidget(
      head: HeadWithButton(
        text: name,
        iconPath: iconPath,
        id: data.id,
        onCLose: (id) {},
      ),
      body: Column(
        children: [
          const CustomDivider(),
          OfficeRoomControlWidget(
            buttonNotifier: data.controls[ControlType.onPress] as Function(int),
            onSwitch: data.controls[ControlType.onSwitch] as Function(bool),
          ),
          const CustomDivider(),
          ClimateWidget(
            valueNotifier:
                data.devices[DeviceType.climate] as ClimateValueNotifier,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}

class MeetingSpaceWidget extends StatelessWidget {
  const MeetingSpaceWidget({
    super.key,
    required this.name,
    required this.id,
    required this.iconPath,
    required this.data,
  });

  final String name;
  final int id;
  final String iconPath;
  final SpaceModel data;

  @override
  Widget build(BuildContext context) {
    return CustomSpaceCardWidget(
      head: HeadWithButton(
        text: name,
        iconPath: iconPath,
        id: id,
        onCLose: (id) {},
      ),
      body: Column(
        children: [
          const CustomDivider(),
          MeetingRoomControlWidget(
            onSwitch: data.controls[ControlType.onSwitch] as Function(bool),
          ),
          const CustomDivider(),
          ClimateWidget(
            valueNotifier:
                data.devices[DeviceType.climate] as ClimateValueNotifier,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}

class RestSpaceWidget extends StatelessWidget {
  const RestSpaceWidget({
    super.key,
    required this.name,
    required this.id,
    required this.iconPath,
    required this.data,
  });

  final String name;
  final int id;
  final String iconPath;
  final SpaceModel data;

  @override
  Widget build(BuildContext context) {
    return CustomSpaceCardWidget(
      head: HeadWithButton(
        text: name,
        iconPath: iconPath,
        id: id,
        onCLose: (id) {},
      ),
      body: Column(
        children: [
          const CustomDivider(),
          MeetingRoomControlWidget(
            onSwitch: data.controls[ControlType.onSwitch] as Function(bool),
          ),
          const CustomDivider(),
          ClimateWidget(
            valueNotifier:
                data.devices[DeviceType.climate] as ClimateValueNotifier,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}

class MainSpaceWidget extends StatelessWidget {
  const MainSpaceWidget({
    super.key,
    required this.data,
  });

  final SpaceModel data;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      children: [
        PowerWidget(
          valueNotifier: data.devices[DeviceType.power] as PowerValueNotifier,
        ),
        const CustomDivider(),
      ],
    );
  }
}
