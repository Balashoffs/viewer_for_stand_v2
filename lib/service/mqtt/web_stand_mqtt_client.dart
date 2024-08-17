import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:uuid/uuid.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/service/mqtt/stand_mqtt_client.dart';

class CustomMqttClient {
  final MqttBrowserClient _client;
  final MqttClientPayloadBuilder _messageBuilder;

  CustomMqttClient(String host, int port)
      : _client = MqttBrowserClient(
          host,
          const Uuid().v4(),
        )..port = port,
        _messageBuilder = MqttClientPayloadBuilder();

  late Function(MqttConnectionState connectionState) _callback;

  set connectionStateCallBack(Function(MqttConnectionState) callback) {
    _callback = callback;
  }

  late Incoming _onIncomingMessage;

  set messageCallBack(Incoming callback) {
    _onIncomingMessage = callback;
  }

  Future<void> connect() async {
    _callback.call(MqttConnectionState.connecting);
    _client.logging(on: false);
    _client.websocketProtocols = MqttClientConstants.protocolsSingleDefault;
    _client.setProtocolV311();
    _client.keepAlivePeriod = 20;
    _client.onDisconnected = onDisconnected;
    _client.onConnected = onConnected;
    _client.pongCallback = pong;
    final connMessage = MqttConnectMessage()
        .withWillQos(MqttQos.atMostOnce);
    _client.connectionMessage = connMessage;
    try {
      MqttClientConnectionStatus? status = await _client.connect();
      if (status != null) {
        _client.updates?.listen(_onListPublished);
      }
    } on NoConnectionException catch (e) {
      _callback.call(MqttConnectionState.faulted);
      _client.disconnect();
      return;
    }

    /// Check we are connected
    if (_client.connectionStatus!.state == MqttConnectionState.connected) {
      _callback.call(MqttConnectionState.connected);
      print('Mosquitto client connected');
    } else {
      _callback.call(MqttConnectionState.faulted);

      /// Use status here rather than state if you also want the broker return code.
      print(
          'ERROR Mosquitto client connection failed - disconnecting, status is ${_client.connectionStatus}');
      _client.disconnect();
      return;
    }
  }

  void _onListPublished(List<MqttReceivedMessage<MqttMessage>> msgs) {
    for (var element in msgs) {
      final recMess = element.payload  as MqttPublishMessage;
      String messageAsString =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      _onIncomingMessage(element.topic, messageAsString);
    }
  }

  Future<void> publish(PublishMqttMessage message) async {
    _messageBuilder.clear();
    _messageBuilder.addString(message.value);
    String topic = message.topic;
    _client.publishMessage(
        topic, MqttQos.atLeastOnce, _messageBuilder.payload!,retain: true);
    _messageBuilder.clear();
  }

  Future<void> close() async {
    _callback.call(MqttConnectionState.disconnecting);
    _client.disconnect();
  }

  /// The subscribed callback
  void subscribe(String topic) {
    _client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void unSubscribe(String topic) {
    _client.unsubscribe(
      topic,
    );
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    _callback.call(MqttConnectionState.disconnected);
    print('OnDisconnected client callback - Client disconnection');
    if (_client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('OnDisconnected callback is solicited, this is correct');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print('OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('Ping response client callback invoked');
  }
}
