enum DeviceType{
  undef(-1),
  climate(1),
  light(2),
  curtains(3),
  power(4),
  camera(5);

  const DeviceType(this.pos);

  final int pos;

  static DeviceType findBy(String name){
    return DeviceType.values.where((element) => element.name == name).firstOrNull ?? DeviceType.undef;
  }

  static DeviceType findByPos(int pos){
    return DeviceType.values.where((element) => element.pos == pos).firstOrNull ?? DeviceType.undef;
  }
}