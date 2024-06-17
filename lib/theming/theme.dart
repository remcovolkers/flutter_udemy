import 'package:flutter/material.dart';

TextTheme _textTheme = ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    );

CardTheme _cardTheme = const CardTheme().copyWith(
  color: _kColorScheme.secondaryContainer,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
);

CardTheme _darkCardTheme = const CardTheme().copyWith(
  color: _kDarkColorScheme.onSecondary,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
);

IconButtonThemeData _iconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    backgroundColor: _kColorScheme.onPrimaryFixedVariant,
    foregroundColor: _kColorScheme.surfaceBright,
  ),
);

IconButtonThemeData _darkIconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    backgroundColor: _kDarkColorScheme.secondary,
    foregroundColor: _kColorScheme.onSecondaryContainer,
  ),
);

ColorScheme _kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 255, 26),
);

ColorScheme _kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 9, 106),
);

AppBarTheme _appBarTheme = const AppBarTheme().copyWith(
  backgroundColor: _kColorScheme.onPrimaryContainer,
  foregroundColor: _kColorScheme.primaryContainer,
);

ThemeData theme = ThemeData().copyWith(
  colorScheme: _kColorScheme,
  appBarTheme: _appBarTheme,
  cardTheme: _cardTheme,
  iconButtonTheme: _iconButtonTheme,
  textTheme: _textTheme,
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: _kDarkColorScheme,
  cardTheme: _darkCardTheme,
  iconButtonTheme: _darkIconButtonTheme,
);
