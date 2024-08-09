import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/custom_mqtt_message.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/climate.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/power.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state.dart';
import 'package:viewer_for_stand_v2/repository/room/room_state_data.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';

part 'update_card_data_state.dart';

part 'update_card_data_cubit.freezed.dart';

class UpdateCardDataCubit extends Cubit<UpdateCardDataState> {
  final Stream<PollMqttMessage>? _mqttPollMessageStream;
  final Stream<RoomStateData> _roomStateDataStream;
  bool _isRoomActive = true;

  UpdateCardDataCubit({
    required MqttRepository? mqttRepository,
    required RoomRepository roomRepository,
  })  : _mqttPollMessageStream = mqttRepository?.pollStream,
        _roomStateDataStream = roomRepository.getPostRoomStream,
        super(const UpdateCardDataState.initial()) {
    _mqttPollMessageStream?.listen(_handleMqttEvent);
    _roomStateDataStream.listen(_handleRoomEvent);
  }

  void _handleRoomEvent(RoomStateData roomStateData) {
    print('_handleRoomEvent before: $_isRoomActive');
    _isRoomActive = roomStateData.state == RoomState.change;
    print('_handleRoomEvent after: $_isRoomActive');
  }

  void _handleMqttEvent(PollMqttMessage message) {
    print('_handleMqttEvent(PollMqttMessage message) ');
    if (_isRoomActive) {
      switch (message.type) {
        case DeviceType.climate:
          ClimateMeter climateMeter = ClimateMeter.fromJson(message.map);
          emit(UpdateCardDataState.fillClimateCard(climateMeter));
          break;
        case DeviceType.power:
          EnergyMeter energyMeter = EnergyMeter.fromJson(message.map);
          emit(UpdateCardDataState.fillPower(energyMeter));
          break;
        default:
          break;
      }
    } else {
      switch (message.type) {
        case DeviceType.climate:
          emit(const UpdateCardDataState.fillClimateCard(ClimateMeter()));
          break;
        case DeviceType.power:
          emit(const UpdateCardDataState.fillPower(EnergyMeter()));
          break;
        default:
          break;
      }
    }
  }
}
