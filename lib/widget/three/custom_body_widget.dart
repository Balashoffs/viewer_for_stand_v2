import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viewer_for_stand_v2/widget/buttons/lighting_buttons.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

import 'data.dart';
import 'head_widget.dart';

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

class OfficeRoomControlWidget extends StatelessWidget {
  const OfficeRoomControlWidget({
    super.key,
    required this.buttonNotifier,
    required this.onSwitch,
  });

  final Function(int) buttonNotifier;
  final Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBodyWriteSwitchWidget(
          name: 'Освещение',
          iconPath: 'assets/svg/control_icon/lighting.svg',
          onSwitch: onSwitch,
        ),
        CustomBodyWriteButtonWidget(
          name: 'Шторы',
          iconPath: 'assets/svg/control_icon/curtains.svg',
          onPress: buttonNotifier,
        ),
      ],
    );
  }
}

class MeetingRoomControlWidget extends StatelessWidget {
  const MeetingRoomControlWidget({
    super.key,
    required this.onSwitch,
  });

  final Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBodyWriteSwitchWidget(
          name: 'Освещение',
          iconPath: 'assets/svg/control_icon/lighting.svg',
          onSwitch: onSwitch,
        ),
      ],
    );
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
    required this.iconPath,
    required this.onSwitch,
  });

  final String name;
  final String iconPath;
  final Function(bool) onSwitch;

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
            child: CustomToggleSwitch(
              onChanged: onSwitch,
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
    required this.iconPath,
    required this.onPress,
  });

  final String name;
  final String iconPath;
  final Function(int) onPress;

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
            child: CustomToggleSwitch(
              onChanged: (updated) {
                int value= updated ? 1 : -1;
                onPress(value);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Divider(
        color: Color.fromRGBO(226, 226, 226, 1.0),
      ),
    );
  }
}
