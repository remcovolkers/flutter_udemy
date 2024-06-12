import 'package:flutter/material.dart';
import 'package:flutter_udemy/dice-roller/components/gradient_container.dart';
import 'package:flutter_udemy/quiz/components/question_screen.dart';
import 'package:flutter_udemy/quiz/components/start_screen.dart';

class Quiz extends StatefulWidget {
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
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      currentScreen = const QuestionScreen();
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
