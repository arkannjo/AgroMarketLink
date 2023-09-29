import 'package:flutter/material.dart';
import '/screens/login_register_screen.dart';
import '/screens/home_screens.dart';
import '/screens/screen_register.dart';

const String homeRoute = '/home';
const String loginRoute = '/login';
const String registerRoute = '/register';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case registerRoute:
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('Página não encontrada')),
        ),
      ); // Uma tela padrão para rotas não reconhecidas.
  }
}
