import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  void onTap(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    changeQuestion();
  }

  late String currentQuestion;
  late var currentAnswers;
  int index = 0;
  @override
  void initState() {
    currentQuestion = questions[index].text;
    currentAnswers = questions[index].getShuffledList().map(
      (e) {
        return Answer(
            answer: e,
            onTap: () {
              onTap(e);
            });
      },
    );
    super.initState();
  }

  void changeQuestion() {
    index = index + 1;
    if (index == questions.length) return;

    setState(() {
      currentQuestion = questions[index].text;
      currentAnswers = questions[index].getShuffledList().map(
        (e) {
          return Answer(
              answer: e,
              onTap: () {
                onTap(e);
              });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Question(question: currentQuestion),
            const SizedBox(
              height: 30,
            ),
            ...currentAnswers,
          ],
        ),
      ),
    );
  }
}
