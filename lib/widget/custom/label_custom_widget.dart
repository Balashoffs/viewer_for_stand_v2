import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabelCustomWidget extends StatelessWidget {
  const LabelCustomWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.style,
    this.height = 48.0,
    this.width = 48.0,
  });

  final String iconPath;
  final String label;
  final TextStyle style;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            iconPath,
            height: height,
            width: width,
          ),
          const SizedBox(width: 12),
          Text(label, style: style),
        ],
      ),
    );
  }
}

class HeadLabelCustomWidget extends StatelessWidget {
  const HeadLabelCustomWidget({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          const SizedBox(width: 8),
          SvgPicture.asset(
            iconPath,
            height: 32.0,
            width: 32.0,
          ),
        ],
      ),
    );
  }
}
