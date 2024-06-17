import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/enums/expense_icons.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final void Function(Expense expense) openEditScreen;
  final Expense expense;
  const ExpenseTile(this.expense, {super.key, required this.openEditScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openEditScreen(expense);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
