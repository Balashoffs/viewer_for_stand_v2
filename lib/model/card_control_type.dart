enum CardControlType{
  undef,
  workroom,
  restroom,
  meetingroom;

  static CardControlType findBy(String name){
    return CardControlType.values.where((element) => element.name == name).firstOrNull ?? CardControlType.undef;
  }
}