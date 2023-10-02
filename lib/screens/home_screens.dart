import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserType?>(
      future: authService.getUserType(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        
        if (snapshot.hasData && snapshot.data != null) {
          UserType userType = snapshot.data!;
          print(userType);
          switch (userType) {
            case UserType.pessoaFisica:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, pessoaFisicaRoute);
              });
              break;
            case UserType.pessoaJuridica:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, pessoaJuridicaRoute);
              });
              break;
            case UserType.produtor:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, produtorRoute);
              });
              break;
            default:
              break;
          }
        }
        
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void handleLogout() {
    authService.logout().then((_) {
      Navigator.pushReplacementNamed(context, loginRoute);
    });
  }
}
