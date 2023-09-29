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
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),

      // Tipografia personalizada
      textTheme: _textTheme(base.textTheme),

      // Botão personalizado
      elevatedButtonTheme: _elevatedButtonTheme(),

      // Ícones com cores do tema
      iconTheme: IconThemeData(color: _primaryColor),

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
            if (states.contains(MaterialState.disabled))
              return Colors.grey.shade300;
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
            return TextStyle(
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
      headline1: base.headline1!.copyWith(fontWeight: FontWeight.w500),
      headline2: base.headline2!.copyWith(fontWeight: FontWeight.w500),
      headline3: base.headline3!.copyWith(fontWeight: FontWeight.w500),
      headline4: base.headline4!.copyWith(fontWeight: FontWeight.w500),
      headline5: base.headline5!.copyWith(fontWeight: FontWeight.w500),
      headline6: base.headline6!.copyWith(fontWeight: FontWeight.w500),
      bodyText1: base.bodyText1!.copyWith(fontWeight: FontWeight.w400),
      bodyText2: base.bodyText2!.copyWith(fontWeight: FontWeight.w400),
      caption: base.caption!.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
      button: base.button!.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }
}
