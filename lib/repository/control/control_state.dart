import 'package:flutter/foundation.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';

class ControlStateChanger<T> {
  final MqttDevice device;
  final ValueNotifier<T> state;
  T _value;

  T get value => _value;

  set value(T nValue) => _value = nValue;

  ControlStateChanger(
    T value, {
    required this.device,
  })  : state = ValueNotifier(value),
        _value = value;
}
