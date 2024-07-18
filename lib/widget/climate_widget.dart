import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClimateInfoWidget extends StatelessWidget {
  const ClimateInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Климат',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/svg/climate.svg', width: 48.0, height: 48.0,),

              ],
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
    return Column(
      children: [
        const SizedBox(height: 16),
        ClimateValueWidget(iconPath: 'assets/svg/temp.svg', label: 'Температура', value: '18,39'),
        const SizedBox(height: 12),
        ClimateValueWidget(iconPath: 'assets/svg/humi.svg', label: 'Влажность', value: '70,30'),
        const SizedBox(height: 12),
        ClimateValueWidget(iconPath: 'assets/svg/press.svg', label: 'Давление', value: '761,12'),
      ],
    );
  }
}

class ClimateValueWidget extends StatelessWidget {
  const ClimateValueWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 20.0,
              width: 20.0,
            ),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
