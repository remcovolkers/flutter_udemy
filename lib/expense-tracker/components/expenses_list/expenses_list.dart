import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/components/expenses_list/expense_tile.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;
  final void Function(Expense expense) onEditExpense;

  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.onRemoveExpense,
    required this.onEditExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expensesList[index]);
        },
        key: ValueKey(expensesList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        child: ExpenseTile(expensesList[index], openEditScreen: onEditExpense),
      ),
    );
  }
}
