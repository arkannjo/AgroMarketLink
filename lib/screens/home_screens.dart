import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AgroMarketLink Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _handleLogout,
            tooltip: "Logout",
          ),
        ],
      ),
      body: _buildLayoutBasedOnScreenSize(),
    );
  }

  void _handleLogout() async {
    await _authService.logout();
    Navigator.pushReplacementNamed(context, loginRoute);
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
    return Center(child: Text("Mobile Layout"));
  }

  Widget _buildTabletLayout() {
    return Center(child: Text("Tablet Layout"));
  }

  Widget _buildDesktopLayout() {
    return Center(child: Text("Desktop Layout"));
  }
}
