import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElectricitySupplyWidget extends StatelessWidget {
  const ElectricitySupplyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Электроснабжение',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/svg/electrosity.svg', width: 48.0, height: 48.0,),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/power.svg', width: 20.0, height: 20.0,),
                    const SizedBox(width: 8),
                    const Text('Мощность', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Text('13,34', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/voltage.svg', width: 20.0, height: 20.0,),
                    const SizedBox(width: 8),
                    const Text('Напряжение', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Text('547,13', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}