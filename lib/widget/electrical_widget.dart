import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/widget/custom/custom.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';

class EnergyMeterDataWidget extends StatelessWidget {
  const EnergyMeterDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Мощность, кW',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Напряжение, V',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Ток, A',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Коэфициент мощности, cosQ',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Частота, Hz',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
          ],
        ),
        BlocBuilder<UpdateCardDataCubit, UpdateCardDataState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              fillPower: (energyMeter) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ValueCustomWidget(value: checkOnEmpty(energyMeter.power)),
                    ValueCustomWidget(value: checkOnEmpty(energyMeter.voltage)),
                    ValueCustomWidget(value: checkOnEmpty(energyMeter.current)),
                    ValueCustomWidget(
                        value: checkOnEmpty(energyMeter.powerFactor)),
                    ValueCustomWidget(
                        value: checkOnEmpty(energyMeter.voltageFrequency)),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }

  String checkOnEmpty(double value) {
    if (value.compareTo(-1.0) == 0) {
      return '??';
    }
    return '$value';
  }
}
