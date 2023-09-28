// /themes/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get agroTheme {
    return ThemeData(
      primaryColor: Color(0xFF4CAF50), // Verde
      colorScheme: ColorScheme.light(
        primary: Color(0xFF4CAF50),
        secondary: Color(0xFF8BC34A), // Verde secundário para destaques
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
