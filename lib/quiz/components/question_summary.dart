import 'package:flutter/material.dart';
import 'package:flutter_udemy/quiz/components/question_result.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (questionResult) {
              return QuestionResult(
                questionResult: questionResult,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
