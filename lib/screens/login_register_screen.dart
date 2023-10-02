// ignore_for_file: unused_element

import 'package:agro_market_link/routes/routes.dart';
import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/custom_button.dart';
import '/widgets/image.dart';

enum AuthState {
  initial,
  loading,
  error,
  success,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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

  void _login() {
  setState(() {
    state = AuthState.loading;
    errorMessage = null;
  });

  handleLogin(); // Chama a função aqui
}

Future<void> handleLogin() async {
  try {
    await _authService.login(emailController.text.trim(), passwordController.text.trim());
    print('Login success');
    setState(() {      
      state = AuthState.success;
    });

    // Navegar para a tela Home após um login bem-sucedido
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Navigating to homeRoute');
      Navigator.pushReplacementNamed(context, homeRoute);
    });

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
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                const CustomMaterialImage(
                            imagePath: '/home/reinaldo/AgroMarketLink/lib/assets/images/Logo.png',
                            width: 150,  // Ajuste conforme necessário
                            height: 150, // Ajuste conforme necessário
                        ),
                        const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress, validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  hint: 'Password',
                  isPassword: true, validator: (value) {
                    return null;
                    },
                ),
                const SizedBox(height: 20),
                if (state == AuthState.error && errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                if (state == AuthState.loading)
                  const CircularProgressIndicator(),
                if (state != AuthState.loading)
                  CustomButton(
                    text: 'Login',
                    onPressed: isValid ? _login : null, // Use o getter diretamente aqui
                  ),
                const SizedBox(height: 20),
                if (state != AuthState.loading)
                  TextButton(
                    child: const Text(
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


