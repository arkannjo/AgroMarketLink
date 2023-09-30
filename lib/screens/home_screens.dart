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
    return Scaffold(
      appBar: AppBar(
        title: const Text("AgroMarketLink Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _handleLogout,
            tooltip: "Logout",
          ),
        ],
      ),
      body: _buildLayoutBasedOnScreenSize(),
    );
  }

  void _handleLogout() {
  authService.logout().then((_) {
    Navigator.pushReplacementNamed(context, loginRoute);
  });
}

  Widget _buildLayoutBasedOnScreenSize() {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return _buildMobileLayout();
    } else if (width < 1200) {
      return _buildTabletLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  Widget _buildMobileLayout() {
    return const Center(child: Text("Mobile Layout"));
  }

  Widget _buildTabletLayout() {
    return const Center(child: Text("Tablet Layout"));
  }

  Widget _buildDesktopLayout() {
    return const Center(child: Text("Desktop Layout"));
  }
}
