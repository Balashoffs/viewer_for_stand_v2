import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabelCustomWidget extends StatelessWidget {
  const LabelCustomWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.style,
  });

  final String iconPath;
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 20.0,
          width: 20.0,
        ),
        const SizedBox(width: 8),
        Text(label, style: style),
      ],
    );
  }
}
