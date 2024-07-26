
class ActionMessage {
  final String topic;
  final String value;

  const ActionMessage({
    required this.topic,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'action': this.topic,
      'value': this.value,
    };
  }

  factory ActionMessage.fromMap(Map<String, dynamic> map) {
    return ActionMessage(
      topic: map['action'] as String,
      value: map['value'] as String,
    );
  }

  @override
  String toString() {
    return 'ActionMessage{action: $topic, value: $value}';
  }
}