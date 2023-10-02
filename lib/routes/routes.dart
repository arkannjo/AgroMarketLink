import 'package:flutter/material.dart';
import '/screens/login_register_screen.dart';
import '/screens/home_screens.dart';
import '/screens/screen_register.dart';
import '/screens/pessoafisica_screen.dart';
import '/screens/pessoajuridica_screen.dart';
import '/screens/produtor_screen.dart';


const String homeRoute = '/home';
const String loginRoute = '/login';
const String registerRoute = '/register';
const String pessoaFisicaRoute = '/pessoafisica';
const String pessoaJuridicaRoute = '/pessoajuridica';
const String produtorRoute = '/produtor';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case registerRoute:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case pessoaFisicaRoute:
      return MaterialPageRoute(builder: (context) => const PessoaFisicaScreen());
    case pessoaJuridicaRoute:
      return MaterialPageRoute(builder: (context) => const PessoaJuridicaScreen());
    case produtorRoute:
      return MaterialPageRoute(builder: (context) => const ProdutorScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Página não encontrada')),
        ),
      ); // Uma tela padrão para rotas não reconhecidas.
  }
}
