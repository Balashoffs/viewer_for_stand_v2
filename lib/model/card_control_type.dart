enum CardControlType{
  undef(-1),
  workroom(1),
  meetingroom(2),
  restroom(3),
  power(4),
  camer(5);

  const CardControlType(this.pos);

  final int pos;

  static CardControlType findBy(String name){
    return CardControlType.values.where((element) => element.name == name).firstOrNull ?? CardControlType.undef;
  }

  static CardControlType findByPos(int pos){
    return CardControlType.values.where((element) => element.pos == pos).firstOrNull ?? CardControlType.undef;
  }
}