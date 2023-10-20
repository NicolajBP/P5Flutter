import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/MyTextField.dart';
import 'package:p5/main.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({Key? key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = ''; // Store the error message

  Future<void> signUserIn(BuildContext context) async {
    // Show the loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      // Navigate to the home page when authentication is successful.
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return const MyApp();
        }),
      );
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors here¨
      //Forkert brugernavn
      if (e.code == 'user-not-found') { 
        setState(() {
          errorMessage = 'Invalid username or password';
        });
        //Forkert password
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      } else {
        //Andre errors xD
        setState(() {
          errorMessage = 'Unknown error: ${e.code}';
        });
      }
      // Dismiss the loading circle when the authentication fails
      Navigator.of(context).pop();
    }
  }

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
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Welcome back',
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 172, 10),
                  fontSize: 16,
                ),
              ),
              MyTextField(
                controller: usernameController, 
                hint: "Username or E-mail",
                inputType: TextInputType.emailAddress,
                isPassword: false,
              ),
              MyTextField(
                controller: passwordController, 
                hint: "Password",              
                inputType: TextInputType.text,
                isPassword: true,
              ),
              if (errorMessage.isNotEmpty) // Display error message if not empty
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red, // You can choose the color
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                  ),
                  onPressed: () {
                    signUserIn(context); // Call the sign-in method
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
              //Registrer ny bruger
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
                    onTap: widget.showRegisterPage,
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
          ),
        ),
      ),
    );
  }
}
