import 'package:flutter_udemy/expense-tracker/models/expense.dart';

class ExpenseResponse {
  final bool isEdit;
  final Expense expense;

  const ExpenseResponse({required this.isEdit, required this.expense});
}
