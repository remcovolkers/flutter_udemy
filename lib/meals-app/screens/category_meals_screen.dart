import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/models/category.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final Category category;

  const CategoryMealsScreen({
    super.key,
    required this.meals,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: meals.isNotEmpty ? _buildMenu() : _noItemsScreen(),
    );
  }

  Widget _buildMenu() {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return Text(
          meals[index].title,
          style: const TextStyle(
            color: Colors.white,
          ),
        );
      },
    );
  }

  Widget _noItemsScreen() {
    return Center(
        child: Text(
      'No items currently known for category ${category.title}',
      style: const TextStyle(
        color: Colors.white,
      ),
    ));
  }
}
