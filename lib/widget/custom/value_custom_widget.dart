import 'package:flutter/cupertino.dart';

class ValueCustomWidget extends StatelessWidget {
  const ValueCustomWidget({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right: 28.0, top: 16.0, bottom: 16.0),
      child: SizedBox(height:24, child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}