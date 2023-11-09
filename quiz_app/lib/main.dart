import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/transition_screen.dart';

void main() {
  runApp(FlutterQuizApp());
}

class FlutterQuizApp extends StatelessWidget {
  const FlutterQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TransitionScreen();
  }
}
