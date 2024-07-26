import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';
import 'package:viewer_for_stand_v2/widget/custom/custom.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

class ClimateInfoWidget extends StatelessWidget {
  const ClimateInfoWidget({super.key});

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
                iconPath: 'assets/svg/climate.svg',
                label: 'Климат',
                style: cardHeadTextStyle),
            ClimateValuesWidget(),
          ],
        ),
      ),
    );
  }
}

class ClimateValuesWidget extends StatelessWidget {
  const ClimateValuesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            LabelCustomWidget(
              iconPath: 'assets/svg/temp.svg',
              label: 'Температура',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/humi.svg',
              label: 'Влажность',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Давление',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Содержание eCO2',
              style: cardLabelTextStyle,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Содержание TVOC',
              style: cardLabelTextStyle,
            ),
          ],
        ),
        BlocBuilder<UpdateCardDataCubit, UpdateCardDataState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              fillClimateCard: (climateMeter) {
                return Column(
                  children: [
                    ValueCustomWidget(value: '${climateMeter.temperature}'),
                    ValueCustomWidget(value: '${climateMeter.humidity}'),
                    ValueCustomWidget(value: '${climateMeter.pressure}'),
                    ValueCustomWidget(value: '${climateMeter.co2}'),
                    ValueCustomWidget(value: '${climateMeter.tvoc}'),
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
