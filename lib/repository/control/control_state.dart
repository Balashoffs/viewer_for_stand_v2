import 'package:flutter/foundation.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';

class ControlStateChanger<T> extends ChangeNotifier {
  final MqttDevice device;
  final int roomId;
  T _value;
  T get value => _value;

  void update(T nValue){
    _value = nValue;
    notifyListeners();
  }

  ControlStateChanger(
    this.roomId,
    T value, {
    required this.device,
  }) : _value = value;

  @override
  String toString() {
    return 'ControlStateChanger{device: $device, roomId: $roomId, _value: $_value}';
  }
}
