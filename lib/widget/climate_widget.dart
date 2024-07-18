import 'package:flutter/material.dart';

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
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.thermostat_outlined, color: Colors.grey[600], size: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.thermostat, 'Температура', '18,39'),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.water_drop_outlined, 'Влажность', '70,30'),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.arrow_downward, 'Давление', '761,12'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.grey[600], size: 20),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}