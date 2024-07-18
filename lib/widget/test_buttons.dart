import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Тестовые кнопки',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Пространство 1',
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.room),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Переговорная 1',
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.meeting_room),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Кухня 1',
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.kitchen),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
