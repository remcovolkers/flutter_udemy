import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/main_drawer.dart';
import 'package:flutter_udemy/meals-app/models/meal.dart';
import 'package:flutter_udemy/meals-app/screens/categories_screen.dart';
import 'package:flutter_udemy/meals-app/screens/category_meals_screen.dart';
import 'package:flutter_udemy/meals-app/screens/filters_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = 'Categories';
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (index == 1) {
        activePageTitle = 'Favorites';
      } else {
        activePageTitle = 'Categories';
      }
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleFavoriteMeal(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Removed ${meal.title} from favorites!');
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage('Marked ${meal.title} as favorite!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = _selectedPageIndex == 0
        ? CategoriesScreen(onToggleFavouriteMeal: _toggleFavoriteMeal)
        : MealsScreen(
            meals: _favoriteMeals,
            onToggleFavorite: _toggleFavoriteMeal,
          );

    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) => _selectPage(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
