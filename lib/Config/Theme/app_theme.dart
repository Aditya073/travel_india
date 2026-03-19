/*
App colors
*/

import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF1F35FF);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1F35FF),
      onPrimary: Color(0xFFFFFFFF),

      secondary: Color(0xFF5C6CFF),
      onSecondary: Color(0xFFFFFFFF),

      background: Color(0xFFF5F7FF),
      onBackground: Color(0xFF1A1A1A),

      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1A1A1A),

      error: Color(0xFFB00020),
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
      primary: Color(0xFF4D5DFF), // lighter version of primary
      onPrimary: Color(0xFFFFFFFF),

      secondary: Color(0xFF9FA8FF),
      onSecondary: Color(0xFF0A0A0A),

      background: Color(0xFF0F1226),
      onBackground: Color(0xFFEAEAFF),

      surface: Color(0xFF1A1D3A),
      onSurface: Color(0xFFEAEAFF),

      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
    ),
  );

}
