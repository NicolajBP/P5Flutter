import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Login/login_or_register.dart';
import 'package:p5/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // When the user is logged in
        if (snapshot.hasData) {
          return const MyApp();
        } 
        else {
          // When the user is not logged in, return the LoginPage
          return const LoginOrRegisterPage(); // You need to pass a unique key to recreate the LoginPage.
        }
      },
    ),
  );
}
}

