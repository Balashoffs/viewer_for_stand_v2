import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
      child: Text(
        text,
        style: cardHeadTextStyle,
      ),
    );
  }
}

class HeadWithButton extends StatelessWidget {
  const HeadWithButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.id,
    required this.onCLose,
  });

  final String text;
  final String iconPath;
  final int id;
  final Function(int id) onCLose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 24.0,
                  width: 24.0,
                ),
                const SizedBox(width: 12),
                Text(text, style: cardHeadTextStyle),
              ],
            ),
            GestureDetector(
              onTap: () => onCLose(id),
              child: const Icon(
                  Icons.close,
                size: 24.0,
                color: Color.fromRGBO(148, 148, 148, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
