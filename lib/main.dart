import '/routes/routes.dart';
import 'package:flutter/material.dart';
import 'services/firebase_service.dart';
import 'services/auth_service.dart';  // Garanta que o AuthService esteja importado
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    String initialRoute = _authService.isUserLoggedIn() ? homeRoute : loginRoute;

    return MaterialApp(
      title: 'AgroMarketLink',
      theme: AppTheme.agroTheme,
      initialRoute: initialRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
