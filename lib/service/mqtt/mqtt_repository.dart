import 'dart:async';
import 'dart:developer';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:viewer_for_stand_v2/models/viewer_mqqt_message.dart';
import 'package:viewer_for_stand_v2/service/mqtt/custom_mqtt_client.dart';

class MqttRepository {
  final CustomMqttClient _mqttClient;

  late StreamController<ActionMessage> _streamController;

  Stream<ActionMessage> get stream => _streamController.stream;

  StreamSink<ActionMessage> get sink => _streamController.sink;
  bool initFlag = false;

  MqttRepository(String host, int port)
      : _mqttClient = CustomMqttClient(host, port);

  Future<void> init() async {
    _mqttClient.connectionStateCallBack = (state) {
      switch (state) {
        case MqttConnectionState.disconnecting:
        case MqttConnectionState.disconnected:
        case MqttConnectionState.faulted:
          _streamController.close();
          break;
        case MqttConnectionState.connecting:
          _streamController = StreamController();
          break;
        case MqttConnectionState.connected:
          stream.listen(_onPublishMessage);
          break;
      }
    };
    _mqttClient.connect().then((value) => initFlag = true);
  }

  void _onPublishMessage(ActionMessage message) {
    log('${message}');
    _mqttClient.publish(message);
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
