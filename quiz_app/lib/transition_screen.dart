import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';

class TransitionScreen extends StatefulWidget {
  TransitionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TransitionScreenState();
  }
}

class _TransitionScreenState extends State<TransitionScreen> {
  late Widget screen;
  List<String> selectedAnswersList = [];

  @override
  void initState() {
    selectedAnswersList = [];
    screen = HomeScreen(switchScreen);
    super.initState();
  }

  void onSelectAnswer(String selectedAnswer) {
    selectedAnswersList.add(selectedAnswer);
    if (selectedAnswersList.length == questions.length) {
      setState(() {
        screen = ResultScreen(
            selectedAnswersList: selectedAnswersList, restartQuiz: restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswersList = [];
      screen = HomeScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      screen = QuestionScreen(onSelectAnswer: onSelectAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.purple]),
          ),
          child: Center(
            child: screen,
          ),
        ),
      ),
    );
  }
}
