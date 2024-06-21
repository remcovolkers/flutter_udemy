import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/meal_item.dart';
import 'package:flutter_udemy/meals-app/screens/meal_details_screen.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) onToggleFavorite;

  const MealsScreen({
    super.key,
    required this.onToggleFavorite,
    required this.meals,
    this.title,
  });

  void _navigateToMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (routeCtx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: _content());
    } else {
      return _content();
    }
  }

  Widget _content() {
    return meals.isNotEmpty ? _buildMenu() : _noItemsScreen();
  }

  Widget _buildMenu() {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            _navigateToMeal(context, meal);
          },
        );
      },
    );
  }

  Widget _noItemsScreen() {
    String screenText = title != null
        ? 'No items currently known for category $title'
        : 'No favorites set, go find them!';

    return Center(
        child: Text(
      screenText,
      style: const TextStyle(
        color: Colors.white,
      ),
    ));
  }
}
