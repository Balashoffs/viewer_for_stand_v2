import 'package:flutter/foundation.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';

class ControlStateChanger<T> {
  final MqttDevice device;
  final int roomId;
  final ValueNotifier<T> state;
  T _value;

  T get value => _value;

  set value(T nValue) => _value = nValue;

  ControlStateChanger(
    this.roomId,
    T value, {
    required this.device,
  })  : state = ValueNotifier(value),
        _value = value;

  @override
  String toString() {
    return 'ControlStateChanger{device: $device, roomId: $roomId, state: ${state.value}, _value: $_value}';
  }

  void update() {
    state.value = _value;
  }
}
