import 'dart:async';
import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:uuid/uuid.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state_data.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/mqtt/stand_mqtt_client.dart';
import 'package:viewer_for_stand_v2/util/mqqt_topic_convertor.dart';

class MqttRepository {
  final CustomMqttClient _mqttClient;

  final StreamController<PublishMqttMessage> _pushStreamController =
      StreamController.broadcast();

  Stream<PublishMqttMessage> get pushStream => _pushStreamController.stream;

  StreamSink<PublishMqttMessage> get pushSink => _pushStreamController.sink;

  final StreamController<PollMqttMessage> _pollStreamController =
      StreamController.broadcast();

  Stream<PollMqttMessage> get pollStream => _pollStreamController.stream;

  StreamSink<PollMqttMessage> get pollSink => _pollStreamController.sink;

  final Stream<RoomStateData> _streamRoomStateData;

  static String clientId = const Uuid().v4();

  MqttRepository({
    required String host,
    required int port,
    required RoomRepository repository,
  })  : _mqttClient = CustomMqttClient(host, port, clientId ),
        _streamRoomStateData = repository.getPostRoomStream;

  Future<void> init() async {
    _mqttClient.connectionStateCallBack = (state) {
      switch (state) {
        case MqttConnectionState.disconnecting:
        case MqttConnectionState.disconnected:
        case MqttConnectionState.faulted:
          _pushStreamController.close();
          break;
        case MqttConnectionState.connecting:
          _mqttClient.messageCallBack = _onIncomingMessage;
          break;
        case MqttConnectionState.connected:
          pushStream.listen(_onPublishMessage);
          break;
      }
    };
    await _mqttClient
        .connect()
        .then((value) => _streamRoomStateData.listen(_onUpdateSubscribes));
  }

  void _onUpdateSubscribes(RoomStateData roomStateData) {
    MqttRoom? lastRoom = roomStateData.lastRoom;
    if (lastRoom != null) {
      for (MqttDevice element in lastRoom.devices) {
        String topic = buildTopic(element.topic, roomTopic: lastRoom.topic);
        _mqttClient.unSubscribe(topic);
      }
    }

    MqttRoom? currentRoom = roomStateData.currentRoom;
    if (currentRoom != null) {
      for (MqttDevice element in currentRoom.devices) {
        String topic =
        buildTopic(element.topic, roomTopic: currentRoom.topic);
        print('subscribe topic: $topic');
        _mqttClient.subscribe(topic);
      }
    }
  }

  void _onPublishMessage(PublishMqttMessage message) {
    _mqttClient.publish(message);
  }

  void _onIncomingMessage(String topic, String message) {
    Map<String, dynamic> map = jsonDecode(message);
    if (topic.startsWith('bimstand')) {
      int index = topic.lastIndexOf('/') + 1;
      String typeAsString = topic.substring(index).split('_')[0];
      DeviceType deviceType = DeviceType.findBy(typeAsString);
      String chunkTopic = topic.substring(topic.indexOf('/') + 1);
      final pmm = PollMqttMessage(type: deviceType, map: map, topic:  chunkTopic);
      if (deviceType == DeviceType.curtains || deviceType == DeviceType.light) {
        print('incoming topic: $topic');
        print('incoming topic: $chunkTopic');
        print(pmm);
      }
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
