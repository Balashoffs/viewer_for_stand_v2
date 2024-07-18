import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomDeviceControlWidget extends StatelessWidget {
  const CustomDeviceControlWidget({
    super.key,
    required this.label,
    required this.on,
    required this.off,
    required this.iconPath,
    required this.onChanged,
  });

  final String label;
  final String on;
  final String off;
  final String iconPath;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        Row(
          children: [
            SvgPicture.asset(iconPath, width: 48, height: 48,),
            Switch(
              value: true,
              onChanged: (bool value) {
                // Handle switch state change
              },
              activeColor: Colors.deepPurple,
            ),
          ],
        )
      ],
    );
  }
}
