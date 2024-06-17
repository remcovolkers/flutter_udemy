import 'package:flutter_udemy/expense-tracker/enums/expense_category.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpenseBucket {
  final ExpenseCategory expenseCategory;
  final List<Expense> expenses;

  const ExpenseBucket({required this.expenseCategory, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.expenseCategory)
      : expenses = allExpenses.where((expense) => expense.category == expenseCategory).toList();

  double get totalExpenses {
    double total = 0;

    for (Expense expense in expenses) {
      total += expense.value;
    }

    return total;
  }
}
