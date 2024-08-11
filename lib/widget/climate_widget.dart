import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';
import 'package:viewer_for_stand_v2/widget/custom/custom.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

class ClimateValuesWidget extends StatelessWidget {
  const ClimateValuesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCardDataCubit, UpdateCardDataState>(
      builder: (context, state) {
        print('BlocBuilder<UpdateCardDataCubit, UpdateCardDataState>');
        return state.maybeWhen(
          orElse: () => SizedBox(),
          fillClimateCard: (climateMeter) {
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
                    climateMeter.pressure.compareTo(-1.0) != 0
                        ? LabelCustomWidget(
                            iconPath: 'assets/svg/press.svg',
                            label: 'Давление',
                            style: cardLabelTextStyle,
                            width: 24,
                            height: 24,
                          )
                        : SizedBox(),
                    climateMeter.co2.compareTo(-1.0) != 0
                        ? LabelCustomWidget(
                            iconPath: 'assets/svg/press.svg',
                            label: 'Содержание eCO2',
                            style: cardLabelTextStyle,
                            width: 24,
                            height: 24,
                          )
                        : SizedBox(),
                    climateMeter.tvoc.compareTo(-1.0) != 0
                        ? LabelCustomWidget(
                            iconPath: 'assets/svg/press.svg',
                            label: 'Содержание TVOC',
                            style: cardLabelTextStyle,
                            width: 24,
                            height: 24,
                          )
                        : SizedBox(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.temperature),
                    ),
                    ValueCustomWidget(
                      value: checkOnEmpty(climateMeter.humidity),
                    ),
                    climateMeter.pressure.compareTo(-1.0) != 0
                        ? ValueCustomWidget(
                            value: checkOnEmpty(climateMeter.pressure),
                          )
                        : SizedBox(),
                    climateMeter.co2.compareTo(-1.0) != 0
                        ? ValueCustomWidget(
                            value: checkOnEmpty(climateMeter.co2),
                          )
                        : SizedBox(),
                    climateMeter.tvoc.compareTo(-1.0) != 0
                        ? ValueCustomWidget(
                            value: checkOnEmpty(climateMeter.tvoc),
                          )
                        : SizedBox(),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  String checkOnEmpty(double value) {
    if (value.compareTo(-1.0) == 0) {
      return '??';
    }
    return '$value';
  }
}
