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
                    ValueCustomWidget(value: '${energyMeter.power}'),
                    ValueCustomWidget(value: '${energyMeter.voltage}'),
                    ValueCustomWidget(value: '${energyMeter.current}'),
                    ValueCustomWidget(value: '${energyMeter.powerFactor}'),
                    ValueCustomWidget(value: '${energyMeter.voltageFrequency}'),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}


