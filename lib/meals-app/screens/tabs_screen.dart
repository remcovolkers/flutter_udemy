import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/data/dummy_data.dart';
import 'package:flutter_udemy/meals-app/screens/categories_screen.dart';
import 'package:flutter_udemy/meals-app/screens/category_meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = 'Categories';
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

  @override
  Widget build(BuildContext context) {
    Widget activePage = _selectedPageIndex == 0
        ? const CategoriesScreen()
        : const MealsScreen(meals: []);

    return Scaffold(
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
