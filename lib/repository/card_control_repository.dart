import 'dart:async';
import 'dart:convert';

import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';

import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/message_mv.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';


class CardControlRepository {
  final StreamSink<PublishMqttMessage>? _mqttPushMessageSink;
  final StreamSink<MessageAsMap>? _onPostMessageSink;


  CardControlRepository({
    required MqttRepository? mqttRepository,
    required ViewerRepository? viewerRepository,
  })  : _mqttPushMessageSink = mqttRepository?.pushSink,
        _onPostMessageSink = viewerRepository?.postViewerSinkStream;

  void onPostControl(String topic, Map<String, dynamic> action) {
    String message = jsonEncode(action);
    PublishMqttMessage actionMessage =
    PublishMqttMessage(topic: topic, value: message);
    _mqttPushMessageSink?.add(actionMessage);
  }

  void onCloseControl(int id) {
    var body = {'id': id};
    MessageMV messageMV = MessageMV.toMessage(
        typeMV: MessageTypeMV.postDisableMarkMV, body: body);
    _onPostMessageSink?.add(messageMV.message);
  }
}
