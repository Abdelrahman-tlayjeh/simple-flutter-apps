import 'package:flutter/material.dart';
import 'pages/input.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
