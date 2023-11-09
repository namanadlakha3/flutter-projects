import 'package:diceRoller/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:diceRoller/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colorList: const [Colors.black, Colors.white],
        ),
      ),
    ),
  );
}
