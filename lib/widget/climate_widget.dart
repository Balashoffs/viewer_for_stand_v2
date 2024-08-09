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
            HeadLabelCustomWidget(
              iconPath: 'assets/svg/climate.svg',
              label: 'Климат',
              style: cardHeadTextStyle,
            ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelCustomWidget(
              iconPath: 'assets/svg/temp.svg',
              label: 'Температура',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/humi.svg',
              label: 'Влажность',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Давление',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Содержание eCO2',
              style: cardLabelTextStyle,
              width: 24,
              height: 24,
            ),
            LabelCustomWidget(
              iconPath: 'assets/svg/press.svg',
              label: 'Содержание TVOC',
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
              fillClimateCard: (climateMeter) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.temperature),
                    ),
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.humidity),
                    ),
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.pressure),
                    ),
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.co2),
                    ),
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.tvoc),
                    ),
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
