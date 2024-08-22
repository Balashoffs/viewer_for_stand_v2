import 'package:viewer_for_stand_v2/models/mqtt/device/curtains.dart';
import 'package:viewer_for_stand_v2/models/mqtt/device/light.dart';

Map<String, dynamic> buildAnswer(String type, dynamic value){
  if(type == 'light'){
    return LightControl(state: value as bool ? 1 : 0).toJson();
  }if(type == 'curtains'){
    return CurtainsControl(direction: value as int).toJson();
  }
  return {};
}
