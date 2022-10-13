import 'dart:math';
import 'package:flutter/material.dart';

double _calculateBmi(int height, int weight) {
  return weight / pow(height / 100, 2);
}

double _calulateIbw(int gender, int height) {
  //convert height from cm to m
  double heightM = height / 100;

  //modify the height if the gender is Female
  if (gender == 1) heightM -= 0.1;

  //calulate the IBW
  return 22.0 * pow(heightM, 2);
}

Map _analayzeBmi(double bmi, int gender, int height) {
  String status;
  Color color;
  IconData icon;
  String ideal;

  //underweight
  if (bmi < 18.5) {
    status = "Underweight";
    color = Colors.orange;
    icon = Icons.error_outline;
  }
  //normal
  else if (bmi <= 24) {
    status = "Normal";
    color = Colors.green;
    icon = Icons.gpp_good_outlined;
  }
  //overweight
  else if (bmi <= 29.9) {
    status = "OverWeight";
    color = Colors.orange;
    icon = Icons.error_outline;
  }
  //obese
  else {
    status = "Obese";
    color = Colors.red;
    icon = Icons.dangerous_outlined;
  }

  //ideal weight
  ideal = _calulateIbw(gender, height).toStringAsFixed(2);

  return {
    "status": status,
    "color": color,
    "ideal": "$ideal kg",
    "icon": icon,
  };
}

class OutputPage extends StatefulWidget {
  final int weight;
  final int height;
  final int age;
  final int gender;

  const OutputPage(
      {Key? key,
      required this.weight,
      required this.height,
      required this.age,
      required this.gender})
      : super(key: key);

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    double bmiDouble = _calculateBmi(widget.height, widget.weight);
    String bmi = bmiDouble.toStringAsFixed(2);
    Map info = _analayzeBmi(bmiDouble, widget.gender, widget.height);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Result"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: Container(
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: info["color"],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      info["icon"],
                      size: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "BMI: ",
                      style: TextStyle(
                        fontSize: 35,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(
                        fontSize: 35,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      info["status"],
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "IBW: ",
                      style: TextStyle(
                        fontSize: 35,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      info["ideal"],
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
