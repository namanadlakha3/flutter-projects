import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  const WhiteText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 32, color: Colors.white),
    );
  }
}
