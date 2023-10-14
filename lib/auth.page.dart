import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/home_page.dart';
import 'login_page.dart';
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
          return  HomePage();
        } 
        else {
          // When the user is not logged in, return the LoginPage
          return LoginPage(key: UniqueKey()); // You need to pass a unique key to recreate the LoginPage.
        }
      },
    ),
  );
}
}

