import 'package:diceRoller/dice_roller.dart';
import 'package:diceRoller/white_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.colorList});

  List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colorList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
