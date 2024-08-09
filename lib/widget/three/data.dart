import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/models/device/device.dart';
import 'package:viewer_for_stand_v2/models/device/device_type.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/climate.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/power.dart';
import 'package:viewer_for_stand_v2/models/room/room_type.dart';

class ClimateValueNotifier {
  final ValueNotifier<double> _temp = ValueNotifier(-1.0);

  ValueNotifier<double> get temp => _temp;

  final ValueNotifier<double> _humi = ValueNotifier(-1.0);

  ValueNotifier<double> get humi => _humi;

  final ValueNotifier<double> _press = ValueNotifier(-1.0);

  ValueNotifier<double> get press => _press;

  final ValueNotifier<double> _tvoc = ValueNotifier(-1.0);

  ValueNotifier<double> get tvoc => _tvoc;

  final ValueNotifier<double> _co2 = ValueNotifier(-1.0);

  ValueNotifier<double> get co2 => _co2;

  void update(ClimateMeter climateMeter) {
    _temp.value = climateMeter.temperature;
    _press.value = climateMeter.pressure;
    _humi.value = climateMeter.humidity;
    _tvoc.value = climateMeter.tvoc;
    _co2.value = climateMeter.co2;
  }
}

class PowerValueNotifier {
  final ValueNotifier<double> _volt = ValueNotifier(-1.0);

  ValueNotifier<double> get volt => _volt;

  final ValueNotifier<double> _power = ValueNotifier(-1.0);

  ValueNotifier<double> get power => _power;

  final ValueNotifier<double> _curr = ValueNotifier(-1.0);

  ValueNotifier<double> get curr => _curr;

  final ValueNotifier<double> _pf = ValueNotifier(-1.0);

  ValueNotifier<double> get pf => _pf;

  final ValueNotifier<double> _vf = ValueNotifier(-1.0);

  ValueNotifier<double> get vf => _vf;

  void update(EnergyMeter energyMeter) {
    _power.value = energyMeter.power;
    _volt.value = energyMeter.voltage;
    _curr.value = energyMeter.current;
    _pf.value = energyMeter.powerFactor;
    _vf.value = energyMeter.voltageFrequency;
  }
}

class SpaceModel {
  final int id;
  final String name;
  final String iconPath;
  final RoomType type;
  final Function(int id)? onCLose;

  SpaceModel({
    this.id = -1,
    this.name = '',
    this.iconPath = '',
    this.type = RoomType.power,
    this.onCLose,
  });

  Map<DeviceType, Object> devices = {};
  Map<ControlType, Object> controls = {};
}


enum ControlType{
  onSwitch, onPress;
}

