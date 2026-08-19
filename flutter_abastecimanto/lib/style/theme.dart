import 'package:flutter/material.dart';
import 'colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: lightBackground,

  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFE91E63),
    foregroundColor: Colors.white,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFE91E63),
    foregroundColor: Colors.white,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: darkBackground,

  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFE91E63),
    foregroundColor: Colors.white,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFE91E63),
    foregroundColor: Colors.white,
  ),
);
