import 'package:flutter/material.dart';
import 'package:flutter_udemy/dice-roller/components/gradient_container.dart';
import 'package:flutter_udemy/quiz/screens/question_screen.dart';
import 'package:flutter_udemy/quiz/screens/quiz_results_screen.dart';
import 'package:flutter_udemy/quiz/screens/start_screen.dart';
import 'package:flutter_udemy/quiz/data/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void resetQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'quiz-results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      currentScreen = QuestionScreen(
        onSelectAnswer: selectAnswer,
      );
    }

    if (activeScreen == 'quiz-results-screen') {
      currentScreen = QuizResultsScreen(
        onResetQuiz: resetQuiz,
        selectedAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: const [
            Color.fromARGB(255, 66, 14, 208),
            Color.fromARGB(255, 29, 9, 84),
          ],
          child: currentScreen,
        ),
      ),
    );
  }
}
