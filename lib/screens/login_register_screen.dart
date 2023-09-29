import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/custom_button.dart';

enum AuthState {
  initial,
  loading,
  error,
  success,
}

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  bool isLoginView = true;
  AuthState state = AuthState.initial;

  bool isValid() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || !email.contains('@') || password.isEmpty || password.length < 6) {
      return false;
    }
    return true;
  }

  void _login() async {
    setState(() {
      state = AuthState.loading;
      errorMessage = null;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() {
        state = AuthState.success;
      });
      // Navegue para a tela inicial ou mostre uma mensagem de sucesso
    } catch (e) {
      setState(() {
        state = AuthState.error;
        errorMessage = e.toString();
      });
    }
  }

  void _register() async {
    setState(() {
      state = AuthState.loading;
      errorMessage = null;
    });

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() {
        state = AuthState.success;
      });
      // Navegue para a tela inicial ou mostre uma mensagem de sucesso
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
        title: Text(isLoginView ? 'Login' : 'Register'),
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
                    text: isLoginView ? 'Login' : 'Register',
                    onPressed: isValid() ? (isLoginView ? _login : _register) : null,
                  ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginView = !isLoginView;
                    });
                  },
                  child: Text(isLoginView ? 'Switch to Register' : 'Switch to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
