import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/pages/home_page.dart';
import '../pages/login_page.dart';
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
class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  //iNTIALLY SHOW LOGIN PAGE 
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return LoginPage(showRegisterPage: showRegisterPage);
  } else {
    return RegisterPage();
  }
}