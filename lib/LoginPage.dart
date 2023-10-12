import 'package:flutter/material.dart';
import 'package:p5/MyTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 250),
                  child: Text(
                    "My Diabuddy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // welcome back, user
              const Text(
                'Welcome back',
                style: TextStyle(
                  color: Color.fromARGB(255, 48, 1, 141),
                  fontSize: 16,
                  
                ),
              ),
                MyTextField(
                  hint: "Email",
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  isPassword: false,
                ),
                MyTextField(
                  hint: "Password",
                  controller: passwordController,
                  inputType: TextInputType.text,
                  isPassword: true,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[700],
                    ),
                    onPressed: () {
                      // Perform login action here
                      debugPrint("Logging in...");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                

                SizedBox(
                  height: 80,
                ),
               
                    
                    
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
