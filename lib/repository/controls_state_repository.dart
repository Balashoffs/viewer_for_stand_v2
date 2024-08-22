import 'package:shared_preferences/shared_preferences.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/control/control_state.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';

class ControlStateRepository {
  final Map<int, List<ControlStateChanger>> controlStates = {};
  final Stream<PollMqttMessage>? _mqttPollMessageStream;

  ControlStateRepository({
    required MqttRepository? mqttRepository,
  }) : _mqttPollMessageStream = mqttRepository?.pollStream {
    _mqttPollMessageStream?.listen(_handleMqttEvent);
  }

  Future<SharedPreferences> get _sp => SharedPreferences.getInstance();

  void fillControlByState(List<MqttRoom> rooms) async {
    for (var room in rooms) {
      controlStates.putIfAbsent(room.roomId, () => []);
      _fillChangers(room.devices, controlStates[room.roomId]);
    }
  }

  void _fillChangers(
      List<MqttDevice> devices, List<ControlStateChanger>? chs) async {
    if (chs != null) {
      SharedPreferences sp = await _sp;
      for (var device in devices) {
        ControlStateChanger? csc;
        if (device.type == 'light') {
          bool value = sp.getBool(device.topic) ?? false;
          csc = ControlStateChanger<bool>(value, device: device);
        } else if (device.type == 'curtains') {
          int value = sp.getInt(device.topic) ?? 0;
          csc = ControlStateChanger<int>(value, device: device);
        }
        if (csc != null) {
          chs.add(csc);
        }
      }
    }
  }

  ControlStateChanger? getControlState(String topic) {
    return controlStates.values
        .reduce((value, element) =>
            element.where((element) => element.device.topic == topic).toList())
        .firstOrNull;
  }

  void updateControlState(String topic, dynamic value) async {
    ControlStateChanger? cs = getControlState(topic);
    if (cs != null) {
      String? type = cs.device.type;
      SharedPreferences sp = await _sp;
      if (type == 'light') {
        bool vl = value as bool;
        sp.setBool(topic, vl);
      } else if (type == 'curtains') {
        int vl = value as int;
        sp.setInt(topic, vl);
      }
    }
  }

  List<ControlStateChanger> getControlStateBy(int roomId) {
    List<ControlStateChanger> chs = controlStates[roomId] ?? [];
    _updateControlState(chs);
    return chs;
  }

  void closeControlCard(int id) async {
    _updateControlState(controlStates[id] ?? []);
  }

  void _updateControlState(List<ControlStateChanger> chs) async {
    SharedPreferences sp = await _sp;
    for (var element in chs) {
      MqttDevice md = element.device;
      if (element.device.type == 'light') {
        bool value = sp.getBool(md.topic) ?? false;
        element.value = value;
      } else if (element.device.type == 'curtains') {
        int value = sp.getInt(md.topic) ?? 0;
        element.value = value;
      }
    }
  }

  void _handleMqttEvent(PollMqttMessage message) {
    switch (message.type) {
      case DeviceType.light:
        ControlStateChanger? control = getControlState(message.topic);
        if (control != null) {
          bool value = message.map['state'] ?? false;
          control.value = value;
          updateControlState(message.topic, value);
        }
        break;
      case DeviceType.curtains:
        ControlStateChanger? control = getControlState(message.topic);
        if (control != null) {
          int value = message.map['state'] ?? -1;
          control.value = value;
          updateControlState(message.topic, value);
        }
        break;
      default:
        break;
    }
  }
}
