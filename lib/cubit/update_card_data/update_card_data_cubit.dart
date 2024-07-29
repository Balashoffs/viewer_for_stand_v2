import 'dart:convert';
import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/climate.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/power.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_room.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';
import 'package:viewer_for_stand_v2/util/mqqt_topic_convertor.dart';

part 'update_card_data_state.dart';

part 'update_card_data_cubit.freezed.dart';

class UpdateCardDataCubit extends Cubit<UpdateCardDataState> {
  final MqttRepository? _mqttRepository;
  final RoomRepository _roomRepository;
  bool _isRoomActive = false;
  MqttRoom? _lastRoom = null;

  UpdateCardDataCubit({
    required MqttRepository? mqttRepository,
    required RoomRepository roomRepository,
  })  : _mqttRepository = mqttRepository,
        _roomRepository = roomRepository,
        super(const UpdateCardDataState.initial()) {
    _mqttRepository?.stream.listen(_handleMqttEvent);
    _roomRepository.getPostRoomStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(MqttRoom room) {
    if (_roomRepository.lastRoomId == -1 && _lastRoom != null) {
      emit(const UpdateCardDataState.initial());
      for (var element in room.devices) {
        String topic = '${room.topic}/${element.topic}';
        _mqttRepository?.unSubscribe(topic);
      }
      _isRoomActive = false;
    }else{
      if(_lastRoom != null && _lastRoom?.roomId != -1){
        for (var element in _lastRoom!.devices) {
          String topic = buildTopic(room.topic, element.topic);
          _mqttRepository?.unSubscribe(topic);
        }
      }
      _lastRoom = room;
      _isRoomActive = true;
      for (var element in room.devices) {
        String topic = buildTopic(room.topic, element.topic);
        _mqttRepository?.subscribe(topic);
      }
    }


  }

  void _handleMqttEvent(CustomMqttMessage message) {
    if (_isRoomActive) {
      DeviceType dt = getTypeFromTopic(message.topic);
      switch (dt) {
        case DeviceType.climate:
          ClimateMeter climateMeter =
              ClimateMeter.fromJson(jsonDecode(message.value));
          emit(UpdateCardDataState.fillClimateCard(climateMeter));
        case DeviceType.power:
          EnergyMeter energyMeter =
              EnergyMeter.fromJson(jsonDecode(message.value));
          emit(UpdateCardDataState.fillPower(energyMeter));
        default:
          break;
      }
    }
  }
}
