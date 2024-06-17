import 'package:flutter/material.dart';
import 'package:flutter_udemy/expense-tracker/expense_tracker.dart';
import 'package:flutter_udemy/expense-tracker/theming/theme.dart';

/// Quiz Runner

// void main() {
//   runApp(const Quiz());
// }

/// Expense Tracker runner
void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      theme: theme,
      home: ExpenseTracker(),
    ),
  );
}
