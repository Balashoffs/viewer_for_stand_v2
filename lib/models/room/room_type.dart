enum RoomType{
  undef(-1),
  workroom(1),
  meetingroom(2),
  restroom(3),
  power(4),
  camera(5);

  const RoomType(this.pos);

  final int pos;

  static RoomType findBy(String name){
    return RoomType.values.where((element) => element.name == name).firstOrNull ?? RoomType.undef;
  }

  static RoomType findByPos(int pos){
    return RoomType.values.where((element) => element.pos == pos).firstOrNull ?? RoomType.undef;
  }
}