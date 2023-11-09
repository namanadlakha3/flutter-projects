import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.switchScreen, {super.key});
  void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Learn Flutter the fun way",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: switchScreen,
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Start Quiz"),
              icon: const Icon(Icons.rice_bowl),
            )
          ],
        ),
      ),
    );
  }
}
