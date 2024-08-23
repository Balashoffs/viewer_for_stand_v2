import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viewer_for_stand_v2/repository/card_control_repository.dart';
import 'package:viewer_for_stand_v2/repository/control/control_state.dart';
import 'package:viewer_for_stand_v2/repository/controls_state_repository.dart';
import 'package:viewer_for_stand_v2/util/answer_util.dart';
import 'package:viewer_for_stand_v2/widget/buttons/lighting_buttons.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

import 'data.dart';
import 'head_widget.dart';

typedef OnChange = Function(String topic, dynamic newValue);
typedef OnPost = Function(String topic, Map<String, dynamic> json);

class PowerWidget extends StatelessWidget {
  const PowerWidget({super.key, required this.valueNotifier});

  final PowerValueNotifier valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadWidget(
          text: 'Электроснабжение',
        ),
        Column(
          children: [
            CustomBodyReadWidget(
                name: 'Мощность, кВт',
                iconPath: 'assets/svg/control_icon/power.svg',
                valueNotifier: valueNotifier.power),
            CustomBodyReadWidget(
                name: 'Напряжение, В',
                iconPath: 'assets/svg/control_icon/power.svg',
                valueNotifier: valueNotifier.volt),
            CustomBodyReadWidget(
                name: 'Ток, А',
                iconPath: 'assets/svg/control_icon/power.svg',
                valueNotifier: valueNotifier.curr),
            CustomBodyReadWidget(
                name: 'Кооэфициент мощности, cos\u03d5',
                iconPath: 'assets/svg/control_icon/power.svg',
                valueNotifier: valueNotifier.pf),
            CustomBodyReadWidget(
                name: 'Частота, Гц',
                iconPath: 'assets/svg/control_icon/power.svg',
                valueNotifier: valueNotifier.vf),
          ],
        )
      ],
    );
  }
}

class ClimateWidget extends StatelessWidget {
  const ClimateWidget({super.key, required this.valueNotifier});

  final ClimateValueNotifier valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBodyReadWidget(
            name: 'Температура, C\u00B0',
            iconPath: 'assets/svg/control_icon/temperature.svg',
            valueNotifier: valueNotifier.temp),
        CustomBodyReadWidget(
            name: 'Влажность, %',
            iconPath: 'assets/svg/control_icon/humi.svg',
            valueNotifier: valueNotifier.humi),
        CustomBodyReadWidget(
            name: 'Давление, мм.рт.',
            iconPath: 'assets/svg/control_icon/press.svg',
            valueNotifier: valueNotifier.press),
        CustomBodyReadWidget(
            name: 'Сo2, ppm',
            iconPath: 'assets/svg/control_icon/co2.svg',
            valueNotifier: valueNotifier.co2),
        CustomBodyReadWidget(
            name: 'TVOC, ppm',
            iconPath: 'assets/svg/control_icon/tvoc.svg',
            valueNotifier: valueNotifier.tvoc),
      ],
    );
  }
}

class CustomRoomControlWidget extends StatelessWidget {
  const CustomRoomControlWidget({
    super.key,
    required this.changers,
  });

  final List<ControlStateChanger> changers;

  /*
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
   */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: changers
          .map((e) => _buildOnParams(
                e,
                context.read<ControlStateRepository>().updateControlState,
                context.read<CardControlRepository>().onPostControl,
              ))
          .toList(),
    );
  }

  Widget _buildOnParams(
      ControlStateChanger changer, OnChange onChange, OnPost onPost) {
    print('_buildOnParams: ${changer.device.topic}');
    if (changer.device.type == 'light') {
      return CustomBodyWriteSwitchWidget(
        name: 'Освещение',
        iconPath: 'assets/svg/control_icon/lighting.svg',
        valueNotifier: changer as ControlStateChanger<bool>,
        topic: changer.device.topic,
        onChanged: onChange,
        onPost: onPost,
      );
    } else if (changer.device.type == 'curtains') {
      return CustomBodyWriteButtonWidget(
        name: 'Шторы',
        iconPath: 'assets/svg/control_icon/curtains.svg',
        valueNotifier: changer as ControlStateChanger<int>,
        topic: changer.device.topic,
        onChange: onChange,
        onUpdate: onPost,
      );
    }
    return const SizedBox();
  }
}

class CustomBodyReadWidget extends StatelessWidget {
  const CustomBodyReadWidget({
    super.key,
    required this.name,
    required this.iconPath,
    required this.valueNotifier,
  });

  final String name;
  final String iconPath;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  iconPath,
                  height: 24.0,
                  width: 24.0,
                ),
              ),
              Text(name, style: cardLabelTextStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (BuildContext context, child, value) {
                return Text('$value', style: cardLabelTextStyle);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBodyWriteSwitchWidget extends StatelessWidget {
  const CustomBodyWriteSwitchWidget({
    super.key,
    required this.name,
    required this.topic,
    required this.iconPath,
    required this.valueNotifier,
    required this.onChanged,
    required this.onPost,
  });

  final String name;
  final String iconPath;
  final String topic;
  final ControlStateChanger<bool> valueNotifier;
  final OnChange onChanged;
  final OnPost onPost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  iconPath,
                  height: 24.0,
                  width: 24.0,
                ),
              ),
              Text(name, style: cardLabelTextStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ListenableBuilder(
              listenable: valueNotifier,
              builder: (BuildContext context, Widget? child) {
                return Switch(
                  value: valueNotifier.value,
                  activeColor: const Color.fromRGBO(103, 77, 178, 1.0),
                  onChanged: (bool value) {
                    onChanged(topic, value);
                    onPost(topic, buildAnswer('light', value));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBodyWriteButtonWidget extends StatelessWidget {
  const CustomBodyWriteButtonWidget({
    super.key,
    required this.name,
    required this.topic,
    required this.iconPath,
    required this.valueNotifier,
    required this.onChange,
    required this.onUpdate,
  });

  final String name;
  final String iconPath;
  final String topic;
  final ControlStateChanger<int> valueNotifier;
  final OnChange onChange;
  final OnPost onUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  iconPath,
                  height: 24.0,
                  width: 24.0,
                ),
              ),
              Text(name, style: cardLabelTextStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ListenableBuilder(
              listenable: valueNotifier,
              builder: (context, child) {
                return Switch(
                  value: valueNotifier.value == 1,
                  activeColor: const Color.fromRGBO(103, 77, 178, 1.0),
                  onChanged: (bool value) {
                    int valueN = value ? 1 : -1;
                    onChange(topic, valueN);
                    onUpdate(topic, buildAnswer('curtains', valueN));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Divider(
        color: Color.fromRGBO(226, 226, 226, 1.0),
      ),
    );
  }
}
