import 'package:flutter/material.dart';

class AppTheme {
  // Cores primárias e secundárias.
  static const _primaryColor = Color(0xFF4CAF50);
  static const _secondaryColor = Color(0xFF8BC34A);

  static ThemeData get agroTheme {
    final base = ThemeData.light();

    return base.copyWith(
      primaryColor: _primaryColor,
      

      // Esquema de Cores
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),

      // Tipografia personalizada
      textTheme: _textTheme(base.textTheme),

      // Botão personalizado
      elevatedButtonTheme: _elevatedButtonTheme(),

      // Ícones com cores do tema
      iconTheme: const IconThemeData(color: _primaryColor),

      // Ajuste a densidade visual para adaptar a interface ao dispositivo
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Sombra padrão para cartões e outros elementos elevados
      cardTheme: CardTheme(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // Tema do botão elevado
  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade300;
            }
            return _primaryColor;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            return const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            );
          },
        ),
      ),
    );
  }

  // Tipografia
  static TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(fontWeight: FontWeight.w500),
      displayMedium: base.displayMedium!.copyWith(fontWeight: FontWeight.w500),
      displaySmall: base.displaySmall!.copyWith(fontWeight: FontWeight.w500),
      headlineMedium: base.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
      headlineSmall: base.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
      titleLarge: base.titleLarge!.copyWith(fontWeight: FontWeight.w500),
      bodyLarge: base.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
      bodyMedium: base.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      bodySmall: base.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
      labelLarge: base.labelLarge!.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }
}
