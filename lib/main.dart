import 'package:flutter/material.dart';
import 'services/firebase_service.dart';
import 'themes/app_theme.dart';
import 'screens/home_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicialize o Firebase através do serviço
  await FirebaseService.initializeFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroMarketLink',
      theme: AppTheme.agroTheme,
      home: HomeScreen(),
    );
  }
}
