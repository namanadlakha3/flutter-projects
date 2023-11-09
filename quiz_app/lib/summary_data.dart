import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  SummaryData({super.key, required this.summaryDataList});
  List<Map<String, Object>> summaryDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryDataList.map((summary) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: summary['chosenAnswer'] == summary['answer']
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        ((summary['index'] as int) + 1).toString(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summary['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            summary['chosenAnswer'] as String,
                            style: TextStyle(color: Colors.pink),
                          ),
                          Text(
                            summary['answer'] as String,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }
}
