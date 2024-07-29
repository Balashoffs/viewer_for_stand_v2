import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/service/mqtt/stand_mqtt_client.dart';

class MqttRepository {
  final CustomMqttClient _mqttClient;

  late StreamController<PublishMqttMessage> _publishStreamController;
  Stream<PublishMqttMessage> get publishStream => _publishStreamController.stream;
  StreamSink<PublishMqttMessage> get publishSink => _publishStreamController.sink;


  late StreamController<PollMqttMessage> _pollStreamController;
  Stream<PollMqttMessage> get pollStream => _pollStreamController.stream;
  StreamSink<PollMqttMessage> get pollSink => _pollStreamController.sink;

  bool initFlag = false;

  MqttRepository(String host, int port)
      : _mqttClient = CustomMqttClient(host, port);

  Future<void> init() async {
    _mqttClient.connectionStateCallBack = (state) {
      switch (state) {
        case MqttConnectionState.disconnecting:
        case MqttConnectionState.disconnected:
        case MqttConnectionState.faulted:
          _publishStreamController.close();
          break;
        case MqttConnectionState.connecting:
          _publishStreamController = StreamController();
          _pollStreamController = StreamController();
          _mqttClient.messageCallBack = _onIncomingMessage;
          break;
        case MqttConnectionState.connected:
          publishStream.listen(_onPublishMessage);
          break;
      }
    };
    await _mqttClient
        .connect()
        .then((value) => initFlag = true);
  }

  void _onPublishMessage(PublishMqttMessage message) {
    log('${message}');
    _mqttClient.publish(message);
  }

  void _onIncomingMessage(String message) {
    Map<String, dynamic> map = jsonDecode(message);
    if(map.containsKey('name')){
      String name = map['name'];
      int index = name.lastIndexOf('/') + 1;
      name = name.substring(index).split('_')[0];
      DeviceType deviceType = DeviceType.findBy(name);
      final pmm = PollMqttMessage(type: deviceType, map: map);
      print(pmm);
      pollSink.add(pmm);
    }
  }

  void subscribe(String topic) {
    _mqttClient.subscribe(topic);
  }

  void unSubscribe(String topic) {
    _mqttClient.unSubscribe(topic);
  }

  Future<void> close() async {
    _mqttClient.close();
  }
}
