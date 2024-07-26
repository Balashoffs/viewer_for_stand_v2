import 'package:flutter/material.dart';

class FlexibleWidgetContainer extends StatelessWidget {
  const FlexibleWidgetContainer({
    super.key,
    this.flex = 6,
    required this.children,
  });

  final int flex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children,
        ),
      ),
      // fit: FlexFit.loose,
    );
  }
}