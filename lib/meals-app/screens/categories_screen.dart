import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/category_grid_item.dart';
import 'package:flutter_udemy/meals-app/data/dummy_data.dart';
import 'package:flutter_udemy/meals-app/models/category.dart';
import 'package:flutter_udemy/meals-app/models/meal.dart';
import 'package:flutter_udemy/meals-app/screens/category_meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (routeCtx) => MealsScreen(
          meals: categoryMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _categoryGrid(context);
  }

  GridView _categoryGrid(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final Category category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
