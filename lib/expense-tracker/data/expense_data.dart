import 'package:flutter_udemy/expense-tracker/enums/expense_category.dart';
import 'package:flutter_udemy/expense-tracker/models/expense.dart';

final List<Expense> expenseData = [
  Expense(
    value: 19.99,
    description: 'Flutter Course',
    date: DateTime.now(),
    category: ExpenseCategory.work,
  ),
  Expense(
    value: 25.00,
    description: 'Cinema',
    date: DateTime.now(),
    category: ExpenseCategory.leisure,
  ),
];
