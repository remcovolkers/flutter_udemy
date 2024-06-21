import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/meals_app.dart';
import 'package:flutter_udemy/meals-app/theming/meal_theme.dart';

/// Quiz Runner

// void main() {
//   runApp(const Quiz());
// }

/// Expense Tracker runner
// void main() {
//   runApp(
//     MaterialApp(
//       themeMode: ThemeMode.dark,
//       darkTheme: darkTheme,
//       theme: theme,
//       home: ExpenseTracker(),
//     ),
//   );
// }

/// Meals App runner
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: mealTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meals App'),
        ),
        body: const MealsApp(),
      ),
    ),
  );
}
