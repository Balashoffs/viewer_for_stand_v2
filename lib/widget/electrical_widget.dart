import 'package:flutter/material.dart';

class ElectricitySupplyWidget extends StatelessWidget {
  const ElectricitySupplyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 160, // Fixed height for the card
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Электроснабжение',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.electrical_services, color: Colors.purple[300], size: 20),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt, color: Colors.grey[600], size: 20),
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
                      Icon(Icons.electric_bolt, color: Colors.grey[600], size: 20),
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
      ),
    );
  }
}