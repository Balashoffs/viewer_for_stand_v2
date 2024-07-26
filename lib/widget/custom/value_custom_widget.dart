import 'package:flutter/cupertino.dart';

class ValueCustomWidget extends StatelessWidget {
  const ValueCustomWidget({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(value, style: const TextStyle(fontWeight: FontWeight.bold));
  }
}