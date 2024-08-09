import 'package:flutter/material.dart';

class CustomSpaceCardWidget extends StatelessWidget {
  const CustomSpaceCardWidget({
    super.key,
    required this.head,
    required this.body,
  });

  final Widget head;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        children: [
          head,
          body,
        ],
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}


