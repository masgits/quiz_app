import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var m = 0; m < chosenAnswers.length; m++) {
      //Loop Body
      summary.add(
        {
          'question_index': m,
          'question': questions[m].text,
          'correct_answer': questions[m].answers[0],
          'user_answer': chosenAnswers[m]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (numCorrectQuestions == 10)
            Container(
              child: Text(
                '🏆',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ))
        ]),
      ),
    );
  }
}
