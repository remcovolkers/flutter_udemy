import 'package:flutter/material.dart';
import 'package:flutter_udemy/dice-roller/components/gradient_container.dart';
import 'package:flutter_udemy/quiz/components/question_screen.dart';
import 'package:flutter_udemy/quiz/components/start_screen.dart';
import 'package:flutter_udemy/quiz/model/question.dart';

class Quiz extends StatefulWidget {
  static const List<Question> questions = [
    Question(
      question: 'What are the main building blocks of Flutter UIs?',
      options: ['Functions', 'Components', 'Widgets', 'Blocks'],
      answer: 'Widgets',
    ),
    Question(
      question: 'Best',
      options: ['best1', 'best2', 'best3', 'best4'],
      answer: 'best1',
    ),
    Question(
      question: 'Kest',
      options: ['kest1', 'kest2', 'kest3', 'kest4'],
      answer: 'kest4',
    )
  ];

  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: const [
            Color.fromARGB(255, 66, 14, 208),
            Color.fromARGB(255, 29, 9, 84),
          ],
          child:
              activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionScreen(),
        ),
      ),
    );
  }
}
