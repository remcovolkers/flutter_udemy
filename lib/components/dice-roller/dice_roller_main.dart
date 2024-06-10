import 'package:flutter/material.dart';
import 'package:flutter_udemy/components/dice-roller/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [
          Color.fromARGB(255, 6, 0, 56),
          Color.fromARGB(255, 80, 0, 80),
        ]),
      ),
    ),
  );
}
