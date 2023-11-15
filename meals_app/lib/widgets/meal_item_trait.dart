import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  MealItemTrait({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
