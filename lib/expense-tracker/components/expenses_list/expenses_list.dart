import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/components/expenses_list/expense_tile.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;

  const ExpensesList({super.key, required this.expensesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => ExpenseTile(expensesList[index]),
    );
  }
}
