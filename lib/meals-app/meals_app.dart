import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/screens/tabs_screen.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return const TabsScreen();
  }
}
