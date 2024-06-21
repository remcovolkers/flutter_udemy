import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/category_grid_item.dart';
import 'package:flutter_udemy/meals-app/data/dummy_data.dart';
import 'package:flutter_udemy/meals-app/models/category.dart';
import 'package:flutter_udemy/meals-app/screens/category_meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext categoryGridItemContext, Category category) {
    Navigator.of(categoryGridItemContext).push(
      MaterialPageRoute(
        builder: (routeCtx) => CategoryMealsScreen(
          meals: dummyMeals
              .where(
                (meal) => meal.categories.contains(category.id),
              )
              .toList(),
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: _categoryGrid(),
    );
  }

  GridView _categoryGrid() {
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
          CategoryGridItem(category: category, onSelectCategory: selectCategory)
      ],
    );
  }
}
