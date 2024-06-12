import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionResult extends StatelessWidget {
  final Map<String, Object> questionResult;

  const QuestionResult({super.key, required this.questionResult});

  @override
  Widget build(BuildContext context) {
    final int questionNo = (questionResult['question_index'] as int) + 1;
    final String questionText = questionResult['question'].toString();
    final String correctAnswer = questionResult['correct_answer'].toString();
    final String givenAnswer = questionResult['given_answer'].toString();
    final bool isCorrect =
        questionResult['given_answer'] == questionResult['correct_answer'];

    TextStyle getGolosStyle(Color? defaultColor) {
      if (defaultColor != null) {
        return GoogleFonts.golosText(
          color: defaultColor,
          fontWeight: FontWeight.w100,
        );
      }

      return GoogleFonts.golosText(
        color: isCorrect && defaultColor == null
            ? const Color.fromARGB(255, 1, 88, 46)
            : const Color.fromARGB(255, 139, 1, 1),
        fontWeight: FontWeight.bold,
      );
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(),
            color: Colors.white,
          ),
          child: Text(
            textAlign: TextAlign.center,
            style: GoogleFonts.golosText(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            questionText,
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: isCorrect
                      ? const Color.fromARGB(255, 213, 255, 214)
                      : const Color.fromARGB(255, 241, 173, 168)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          style: getGolosStyle(Colors.white),
                          questionNo.toString(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: getGolosStyle(
                            const Color.fromARGB(255, 0, 0, 0),
                          ),
                          'Correct answer: $correctAnswer',
                        ),
                        Text(
                          style: getGolosStyle(null),
                          'Your answer: $givenAnswer',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
