import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.answer,
    required this.onTap,
  });
  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            40,
          ))),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromARGB(255, 233, 233, 233),
        ),
      ),
    );
  }
}
