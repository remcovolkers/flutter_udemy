import 'package:flutter/material.dart';
import 'package:flutter_udemy/quiz/components/question_summary.dart';
import 'package:flutter_udemy/quiz/data/quiz_questions.dart';
import 'package:flutter_udemy/quiz/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResultsScreen extends StatelessWidget {
  const QuizResultsScreen({
    super.key,
    required this.onResetQuiz,
    required this.selectedAnswers,
  });

  final void Function() onResetQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'given_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int noCorrectAnswers = getSummaryData()
        .where((answer) => answer['correct_answer'] == answer['given_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $noCorrectAnswers out of ${questions.length} questions correctly!',
              style: GoogleFonts.golosText(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onResetQuiz,
              child: SizedBox(
                width: 150,
                child: Row(
                  children: [
                    const Icon(Icons.undo),
                    const SizedBox(width: 20),
                    Text(
                      'Retake Quiz',
                      style: GoogleFonts.golosText(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
