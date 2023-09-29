import 'package:agro_market_link/routes/routes.dart';
import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/custom_button.dart';

enum AuthState {
  initial,
  loading,
  error,
  success,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  AuthState state = AuthState.initial;

  @override
  void initState() {
    super.initState();

    // Adicione listeners para atualizar a tela quando os valores dos campos de texto mudarem
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Lembre-se de descartar os controladores quando eles não forem mais necessários
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get isValid {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    return email.isNotEmpty && email.contains('@') && password.isNotEmpty && password.length >= 6;
  }

  void _login() async {
    setState(() {
      state = AuthState.loading;
      errorMessage = null;
    });

    try {
      await _authService.login(emailController.text.trim(), passwordController.text.trim());
      setState(() {
        state = AuthState.success;
      });      
      // Navegar para a tela Home após um login bem-sucedido
      Navigator.pushReplacementNamed(context, homeRoute);
    } catch (e) {
      setState(() {
        state = AuthState.error;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  hint: 'Password',
                  isPassword: true,
                ),
                SizedBox(height: 20),
                if (state == AuthState.error && errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 20),
                if (state == AuthState.loading)
                  CircularProgressIndicator(),
                if (state != AuthState.loading)
                  CustomButton(
                    text: 'Login',
                    onPressed: isValid ? _login : null, // Use o getter diretamente aqui
                  ),
                SizedBox(height: 20),
                if (state != AuthState.loading)
                  TextButton(
                    child: Text(
                      'Não tem uma conta? Registre-se',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, registerRoute);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
