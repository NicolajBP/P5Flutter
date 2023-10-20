import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:p5/MyTextField.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
     Key? key,
    required this.showLoginPage, 
    })({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

Future signUp() async {}

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.amber[300],
          body: const SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                     Icon(
                      Icons.bloodtype,
                      size: 100,
                     ),
                     SizedBox(height: 75),

                     //Hello again!
                     Text(
                      'Hello Again!',
                      style: TextStyle(
                        fontSize: 52,
                      ),
                     ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome back, friend',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 50),

                      //email textfield
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            )
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Email or username'
                          fillColor: Colors.blueGrey[200],
                          filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //password textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightGreen[300]),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Password',
                            fillColor: Colors.blueGrey[300],
                            filled: true,
                          ),
                        ),
                      ),

                      //sign in button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: signIn,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[250],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ), 
                        ),

                        SizedBox(height: 25),

                        //not a member? register now! 
                      Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(       //Vi vælger typen af tekst.
                    'New user? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(   //Ny tekst, da dette laves til widget som kan trykkes på
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Register now.',          
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],  
              ),
                  ],
                  )
                )
                ),
              )
      ),
    );
  }
}
