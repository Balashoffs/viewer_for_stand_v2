import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LightingButton extends StatelessWidget {
  const LightingButton({super.key, required this.onChanged});

  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 48,
        child: LiteRollingSwitch(
          value: false,
          textOn: 'вкл',
          textOff: 'выкл',
          textOnColor: Colors.white,
          colorOn: Colors.deepPurple,
          colorOff: Colors.grey,
          iconOn: Icons.light_rounded,
          iconOff: Icons.light_outlined,
          animationDuration: const Duration(milliseconds: 300),
          onChanged: onChanged,
          onDoubleTap: () {},
          onSwipe: () {},
          onTap: () {},
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onChanged,
  });

  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 36,
        width: 96,
        child: LiteRollingSwitch(
          value: false,
          textOn: '',
          textOff: '',
          textOnColor: Colors.white,
          colorOn: Colors.deepPurple,
          colorOff: Colors.grey,
          iconOff: Icons.highlight_off_outlined,
          iconOn: Icons.check,
          animationDuration: const Duration(milliseconds: 300),
          onChanged: onChanged,
          onDoubleTap: () {},
          onSwipe: () {},
          onTap: () {},
        ),
      ),
    );
  }
}

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({
    super.key,
    required this.onChanged,
    required this.isOn,
  });

  final Function(bool) onChanged;
  final bool isOn;

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  bool isLight = false;


  @override
  void initState() {
    super.initState();
    print('initState::widget.isOn: ${widget.isOn}');
    print('initState::widget.isOn: ${isLight}');
    isLight = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    print('build::widget.isOn: ${widget.isOn}');
    print('build::widget.isOn: ${isLight}');
    return Switch(
      value: isLight,
      activeColor: const Color.fromRGBO(103, 77, 178, 1.0),
      onChanged: (bool value) {
        setState(() {
          isLight = value;
          widget.onChanged.call(value);
        });
      },
    );
  }
}
