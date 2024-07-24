import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/control_card_cubit/control_card_cubit.dart';
import 'package:viewer_for_stand_v2/model/device.dart';

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
                      onPressed: () {
                        context.read<ControlCardCubit>().selectDevice(Device(roomId: 123, roomType: 1, roomName: '', ));
                      },
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
                      onPressed: () {
                        context.read<ControlCardCubit>().selectDevice(Device(roomId: 321, roomType: 2, roomName: ''));
                      },
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
                      onPressed: () {context.read<ControlCardCubit>().selectDevice(Device(roomId: 234, roomType: 3, roomName: ''));},
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
