/*
primary - #0e52b8
#d6e6f3
#000926
#a6c5d8
*/

import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF0E52B8);
  static const darkColor = Color(0xFF000926);
  static const powderBlue = Color(0xFFA6C5D8);
  static const iceBlue = Color(0xFFD6E6F3);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0E52B8),
      onPrimary: Color(0xFFFFFFFF),

      secondary: Color(0xFFA6C5D8),
      onSecondary: Color(0xFF0E2A47),

      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF0A1A2F),

      error: Color(0xFFB3261E),
      onError: Color(0xFFFFFFFF),
    ),

    cardTheme: CardThemeData(
      color: primaryColor.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4A8FE7), // lighter version of primary
      onPrimary: Color(0xFF000926),

      secondary: Color(0xFFA6C5D8),
      onSecondary: Color(0xFF000926),

      surface: Color(0xFF0A1A3A),
      onSurface: Color(0xFFD6E6F3),

      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
    ),
  );
}
