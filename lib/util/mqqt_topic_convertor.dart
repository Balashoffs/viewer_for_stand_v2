import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';

String rootTopic = 'bimstand';

DeviceType getTypeFromMqttDevice(MqttDevice device) {
  return DeviceType.values
          .where((element) => device.topic.contains(element.name))
          .firstOrNull ??
      DeviceType.undef;
}

DeviceType getTypeFromTopic(String topic) {
  return DeviceType.values
          .where((element) => element.name.contains(topic))
          .firstOrNull ??
      DeviceType.undef;
}

String? findByType(MqttRoom room, DeviceType type) {
  List<MqttDevice> devices = room.devices;
  MqttDevice? device = devices.where((element) {
    return element.type == type.name;
  }).firstOrNull;
  if (device != null) {
   device.topic;
  }
  return null;
}

String buildTopic(String deviceTopic, { String roomTopic = ''}) {
  return roomTopic.isEmpty ? '$rootTopic/$deviceTopic' : '$rootTopic/$roomTopic/$deviceTopic';
}
