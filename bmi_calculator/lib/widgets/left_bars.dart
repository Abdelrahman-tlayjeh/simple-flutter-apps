import 'package:bmi_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LeftBars extends StatelessWidget {
  final double space = 7;
  const LeftBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LeftBar(
          barWidth: 60,
        ),
        SizedBox(height: space),
        const LeftBar(
          barWidth: 80,
        ),
        SizedBox(height: space),
        const LeftBar(
          barWidth: 68,
        ),
        SizedBox(height: space),
      ],
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barWidth;

  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
