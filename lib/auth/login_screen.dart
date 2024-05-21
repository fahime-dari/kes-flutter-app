import 'dart:developer';
import 'package:ap4/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ap4/widgets/button.dart';
import 'package:ap4/widgets/textfield.dart';
import 'package:ap4/auth/auth_service.dart';
import 'package:ap4/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            Image.asset('android/images/logo.jpg', height: 120),
            const Text("KES Interviention : Connexion",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Veuillez entrer votre e-mail.",
              label: "E-mail",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Veuillez entrer votre mot de passe.",
              label: "Mot de passe",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Se connecter",
              onPressed: _login,
            ),
            const SizedBox(height: 5),
            const Spacer()
          ],
        ),
      ),
    );
  }

  // Méthode pour rediriger vers l'écran de connexion
  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}
