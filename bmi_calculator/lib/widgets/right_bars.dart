import 'package:bmi_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RightBars extends StatelessWidget {
  final double space = 7;
  const RightBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RightBar(
          barWidth: 60,
        ),
        SizedBox(height: space),
        const RightBar(
          barWidth: 80,
        ),
        SizedBox(height: space),
        const RightBar(
          barWidth: 68,
        ),
        SizedBox(height: space),
      ],
    );
  }
}

class RightBar extends StatelessWidget {
  final double barWidth;

  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
