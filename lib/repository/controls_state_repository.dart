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
      _fillChangers(
          room.roomId, room.topic, room.devices, controlStates[room.roomId]);
    }
  }

  void _fillChangers(int roomId, String roomTopic, List<MqttDevice> devices,
      List<ControlStateChanger>? chs) async {
    if (chs != null) {
      SharedPreferences sp = await _sp;
      for (var device in devices) {
        String topicN = '$roomTopic/${device.topic}';
        ControlStateChanger? csc;
        if (device.type == 'light') {
          bool value = sp.getBool(topicN) ?? false;
          csc = ControlStateChanger<bool>(roomId, value,
              device: device.copyWith(topic: topicN));
        } else if (device.type == 'curtains') {
          int value = sp.getInt(topicN) ?? 0;
          csc = ControlStateChanger<int>(roomId, value,
              device: device.copyWith(topic: topicN));
        }
        if (csc != null) {
          print(csc.toString());
          chs.add(csc);
        }
      }
    }
  }

  ControlStateChanger? getControlState(String topic) {
    ControlStateChanger? csc;
    for (var state in controlStates.values) {
      for (var device in state) {
        if (topic.contains(device.device.topic)) {
          csc = device;
          break;
        }
      }
    }
    return csc;
  }

  void updateControlState(String topic, dynamic value) async {
    ControlStateChanger? cs = getControlState(topic);
    if (cs != null) {
      updateControlStateWith(cs, value);
    }
  }

  void updateControlStateWith(ControlStateChanger cs, dynamic value) async {
    String? type = cs.device.type;
    SharedPreferences sp = await _sp;
    if (type == 'light') {
      bool vl = value as bool;
      sp.setBool(cs.device.topic, vl);
      cs.value = vl;
    } else if (type == 'curtains') {
      int vl = value as int;
      sp.setInt(cs.device.topic, vl);
      cs.value = vl;
    }
  }

  List<ControlStateChanger> getControlStateBy(int roomId) {
    List<ControlStateChanger> chs = controlStates[roomId] ?? [];
    _updateControlState(chs);
    return chs;
  }

  void closeControlCard(int id) async {
    return _updateControlState(controlStates[id] ?? []);
  }

  void _updateControlState(List<ControlStateChanger> chs) async {
    SharedPreferences sp = await _sp;
    for (var element in chs) {
      MqttDevice md = element.device;
      if (element.device.type == 'light') {
        bool value = sp.getBool(md.topic) ?? false;
        element.state.value = value;
        element.value = value;
      } else if (element.device.type == 'curtains') {
        int value = sp.getInt(md.topic) ?? 0;
        element.state.value = value;
        element.value = value;
      }
    }
  }

  void _handleMqttEvent(PollMqttMessage message) {
    switch (message.type) {
      case DeviceType.light:
        ControlStateChanger? control = getControlState(message.topic);
        if (control != null) {
          bool value = (message.map['state'] ?? 0) == 1;
          if (value != control.value) {
            control.state.value = value;
            updateControlStateWith(control, value);
          }
        }
        break;
      case DeviceType.curtains:
        ControlStateChanger? control = getControlState(message.topic);
        if (control != null) {
          int value = message.map['direction'] ?? -1;
          if (value != control.value) {
            control.state.value = value;
            updateControlStateWith(control, value);
          }
        }
        break;
      default:
        break;
    }
  }
}
