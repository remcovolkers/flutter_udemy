import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/enums/expense_category.dart';

Map<ExpenseCategory, IconData> expenseIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.leisure: Icons.sports_football,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.work: Icons.work,
};
