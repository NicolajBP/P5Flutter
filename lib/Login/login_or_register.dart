import "package:flutter/material.dart";
import 'package:p5/Login/login_page.dart';
import 'package:p5/Login/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // Start med at vise login side
  bool showLoginPage = true;


  // Skift mellem login og register pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage; // Skifter showLoginPage mellem sand og falsk
    });
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }

  }
}