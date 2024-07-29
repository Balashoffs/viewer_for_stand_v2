import 'dart:convert';
import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/climate.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/power.dart';
import 'package:viewer_for_stand_v2/models/mqtt/mqtt_device.dart';
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
    _mqttRepository?.pollStream.listen(_handleMqttEvent);
    _roomRepository.getPostRoomStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(MqttRoom room) {
    print('Income new room');
    if (_lastRoom != null && room.roomId == _lastRoom?.roomId) {
      print('_lastRoom != null && room.roomId == _lastRoom?.roomId');
      emit(const UpdateCardDataState.initial());
      for (var element in room.devices) {
        String type = element.type;
        DeviceType dt = DeviceType.findBy(type);
        if(dt == DeviceType.climate){
          String topic = buildTopic(element.topic, roomTopic: _lastRoom!.topic);
          _mqttRepository?.unSubscribe(topic);
        }
      }
      _isRoomActive = false;
    }else{
      if(_lastRoom != null && _lastRoom?.roomId != -1){
        print('_lastRoom != null && _lastRoom?.roomId != -1');
        for (MqttDevice element in _lastRoom!.devices) {
          String type = element.type;
          DeviceType dt = DeviceType.findBy(type);
          if(dt == DeviceType.climate){
            String topic = buildTopic(element.topic, roomTopic: _lastRoom!.topic);
            _mqttRepository?.unSubscribe(topic);
          }
        }
      }
      _lastRoom = room;
      _isRoomActive = true;
      for (var element in room.devices) {
        String type = element.type;
        DeviceType dt = DeviceType.findBy(type);
        if(dt == DeviceType.climate){
          String topic = buildTopic(element.topic, roomTopic: _lastRoom!.topic);
          _mqttRepository?.subscribe(topic);
        }
      }
    }


  }

  void _handleMqttEvent(PollMqttMessage message) {
    print('_handleMqttEvent(PollMqttMessage message) ');
    if (_isRoomActive) {
        switch (message.type) {
        case DeviceType.climate:
          ClimateMeter climateMeter =
              ClimateMeter.fromJson(message.map);
          emit(UpdateCardDataState.fillClimateCard(climateMeter));
        case DeviceType.power:
          EnergyMeter energyMeter =
              EnergyMeter.fromJson(message.map);
          emit(UpdateCardDataState.fillPower(energyMeter));
        default:
          break;
      }
    }
  }
}
