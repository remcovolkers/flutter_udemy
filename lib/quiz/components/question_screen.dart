import 'package:flutter/material.dart';
import 'package:flutter_udemy/quiz/components/answer_button.dart';
import 'package:flutter_udemy/quiz/data/quiz_questions.dart';
import 'package:flutter_udemy/quiz/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.golosText(
                color: const Color.fromARGB(255, 177, 211, 255),
                fontSize: 36,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer,
                onTap: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
