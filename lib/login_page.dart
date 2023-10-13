import 'package:flutter/material.dart';
import 'package:p5/MyTextField.dart';
import 'package:p5/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              const Text(
                'Welcome back',
                style: TextStyle(
                  color: Color.fromARGB(255, 48, 1, 141),
                  fontSize: 16,
                ),
              ),
              MyTextField(
                hint: "Username or E-mail",
                controller: TextEditingController(),
                inputType: TextInputType.emailAddress,
                isPassword: false,
              ),
              MyTextField(
                hint: "Password",
                controller: TextEditingController(),
                inputType: TextInputType.text,
                isPassword: true,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const MyApp();
                      }),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
