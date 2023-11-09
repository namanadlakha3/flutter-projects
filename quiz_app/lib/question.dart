import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatelessWidget {
  Question({super.key, required this.question});
  String question;

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
