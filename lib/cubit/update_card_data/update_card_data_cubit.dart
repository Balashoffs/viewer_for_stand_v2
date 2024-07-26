import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/climate.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/power.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';

part 'update_card_data_state.dart';

part 'update_card_data_cubit.freezed.dart';

class UpdateCardDataCubit extends Cubit<UpdateCardDataState> {
  final MqttRepository _mqttRepository;

  UpdateCardDataCubit({required MqttRepository mqttRepository})
      : _mqttRepository = mqttRepository,
        super(const UpdateCardDataState.initial()){
    _mqttRepository.stream.listen((event) {
      // emit(UpdateCardDataState.fillClimateCard())
    });
  }
}
