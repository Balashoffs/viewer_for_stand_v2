import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewer_for_stand_v2/widget/custom/custom.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

import 'buttons/curtains_buttons.dart';
import 'buttons/lighting_buttons.dart';

class OpenSpaceControlWidget extends StatelessWidget {
  const OpenSpaceControlWidget({
    super.key,
    required this.name,
    required this.onCurtainsUp,
    required this.onCurtainsDown,
    required this.onLightingSwitch,
  });

  final String name;
  final VoidCallback onCurtainsUp;
  final VoidCallback onCurtainsDown;
  final Function(bool) onLightingSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelCustomWidget(iconPath: 'assets/svg/curtains.svg', label: 'Шторы', style: cardHeadTextStyle),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            CurtainsButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: onCurtainsUp,
            ),
            CurtainsButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: onCurtainsDown,
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/svg/lighting.svg',
          fit: BoxFit.fitWidth,
        ),
        LightingButton(
          onChanged: onLightingSwitch,
        ),
      ],
    );
  }
}


