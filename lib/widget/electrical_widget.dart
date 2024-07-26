import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/widget/custom/custom.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';

class EnergyMeterCardWidget extends StatelessWidget {
  const EnergyMeterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelCustomWidget(
              iconPath: 'assets/svg/electrosity.svg',
              label: 'Электроснабжение',
              style: cardHeadTextStyle,
            ),
            const EnergyMeterDataWidget(),
          ],
        ),
      ),
    );
  }
}

class EnergyMeterDataWidget extends StatelessWidget {
  const EnergyMeterDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            LabelCustomWidget(
              iconPath: 'assets/svg/power.svg',
              label: 'Мощность, W',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/voltage.svg',
              label: 'Напряжение, V',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/voltage.svg',
              label: 'Ток, A',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/voltage.svg',
              label: 'Коэфициент мощности, cosQ',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/voltage.svg',
              label: 'частота, Hz',
              style: cardLabelTextStyle,
            ),
          ],
        ),
        BlocBuilder<UpdateCardDataCubit, UpdateCardDataState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              fillPower: (energyMeter) {
                return Column(
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


