import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary_data.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key,
      required this.selectedAnswersList,
      required this.restartQuiz});

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryDataList = [];
    for (var i = 0; i < questions.length; i++) {
      summaryDataList.add({
        'question': questions[i].text,
        'index': i,
        'answer': questions[i].answers[0],
        'chosenAnswer': selectedAnswersList[i]
      });
    }
    return summaryDataList;
  }

  final List<String> selectedAnswersList;
  void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctAnswer = summaryData.where((data) {
      return data['answer'] == data['chosenAnswer'];
    }).length;
    final totalQuestion = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $correctAnswer out of $totalQuestion",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            SummaryData(summaryDataList: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              label: const Text("Restart Quiz"),
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
