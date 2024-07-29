import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewer_for_stand_v2/widget/buttons/lighting_buttons.dart';

typedef OnLightingSwitch = Function( bool);
typedef OnCurtainsSwitch = Function( int);

class OpenSpaceControl2Widget extends StatelessWidget {
  const OpenSpaceControl2Widget({
    super.key,
    required this.spaceName,
    required this.spaceIconPath,
    required this.onLightingSwitch,
    required this.onCurtainsSwitch,
  });

  final String spaceName;
  final String spaceIconPath;
  final OnLightingSwitch onLightingSwitch;
  final OnCurtainsSwitch onCurtainsSwitch;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  spaceName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  spaceIconPath,
                  width: 64.0,
                  height: 64.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/curtains_on.svg',
                      width: 64.0,
                      height: 64.0,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Шторы',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans-Bold',
                        color: Colors.deepPurple,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomToggleSwitch(
                  onChanged: (p0) {
                    onCurtainsSwitch(p0 == true ? 1 : -1) ;
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/light_on.svg',
                      width: 64.0,
                      height: 64.0,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Освещение',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans-Bold',
                        color: Colors.deepPurple,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomToggleSwitch(
                  onChanged: onLightingSwitch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MeetingControl2Widget extends StatelessWidget {
  const MeetingControl2Widget({
    super.key,
    required this.spaceName,
    required this.spaceIconPath,
    required this.onBookingSwitch,
  });

  final String spaceName;
  final String spaceIconPath;
  final Function(bool) onBookingSwitch;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  spaceName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  spaceIconPath,
                  width: 64.0,
                  height: 64.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/booking_on.svg',
                      width: 64.0,
                      height: 64.0,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Бронирование',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans-Bold',
                        color: Colors.deepPurple,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomToggleSwitch(
                  onChanged: onBookingSwitch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RestSpaceControl2Widget extends StatelessWidget {
  const RestSpaceControl2Widget({
    super.key,
    required this.spaceName,
    required this.spaceIconPath,
    required this.onBookingSwitch,
  });

  final String spaceName;
  final String spaceIconPath;
  final Function(bool) onBookingSwitch;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  spaceName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  spaceIconPath,
                  width: 64.0,
                  height: 64.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/light_on.svg',
                      width: 64.0,
                      height: 64.0,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Освещение',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans-Bold',
                        color: Colors.deepPurple,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomToggleSwitch(
                  onChanged: onBookingSwitch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}