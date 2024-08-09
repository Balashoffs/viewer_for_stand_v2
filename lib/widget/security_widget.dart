import 'package:flutter/material.dart';

class SecuritySettingsWidget extends StatelessWidget {
  const SecuritySettingsWidget({Key? key}) : super(key: key);

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
                const Text('Камера наблюдения'),
                Switch(
                  value: true,
                  onChanged: (bool value) {
                    // Handle switch state change
                  },
                  activeColor: Colors.deepPurple,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 256,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}