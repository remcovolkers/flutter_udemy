import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/enums/expense_icons.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  const ExpenseTile(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              expense.description,
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Text('€${expense.value.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(expenseIcons[expense.category]),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
