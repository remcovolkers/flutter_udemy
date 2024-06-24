import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy/meals-app/components/main_drawer.dart';
import 'package:flutter_udemy/meals-app/data/dummy_data.dart';
import 'package:flutter_udemy/meals-app/models/meal.dart';
import 'package:flutter_udemy/meals-app/providers/meals_prodiver.dart';
import 'package:flutter_udemy/meals-app/screens/categories_screen.dart';
import 'package:flutter_udemy/meals-app/screens/category_meals_screen.dart';
import 'package:flutter_udemy/meals-app/screens/filters_screen.dart';

const kInitialFilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = 'Categories';
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            selectedFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
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
    final List<Meal> availableMeals = ref.watch(mealsProvider).where((meal) {
      if (_selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = _selectedPageIndex == 0
        ? CategoriesScreen(
            onToggleFavouriteMeal: _toggleFavoriteMeal,
            availableMeals: availableMeals,
          )
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
