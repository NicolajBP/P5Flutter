// import 'dart:ffi';

// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/components/MyTextField.dart';
import 'package:p5/main.dart';
import 'package:p5/uploadCgmData.dart';

DateTime now = DateTime.now();
DateTime yesterday = now.subtract(const Duration(days: 1));
DateTime tomorrow = now.add(const Duration(days: 1));
// ignore: non_constant_identifier_names
String dateYYYY_MM_DD = now.toString().substring(0, 10);
// ignore: non_constant_identifier_names
String yesterdayYYYY_MM_DD = yesterday.toString().substring(0, 10);
// ignore: non_constant_identifier_names
String tomorrowYYYY_MM_DD = tomorrow.toString().substring(0, 10);

class RegisterPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  final Function()? onTap;
  // ignore: use_key_in_widget_constructors
  const RegisterPage({Key? key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String errorMessage = ''; // Store the error message

  Future<void> signUserUp(BuildContext context) async {
    // Show the loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    // try creating the user
    try {
      // CGMData cgmData = CGMData(measurements: "2")

      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        final UserCredential currentUser =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        // Map<String, dynamic> ?data = {"email": usernameController.text};
        var collection = FirebaseFirestore.instance.collection("users");
        collection
            .doc(currentUser.user!.uid)
            .set({
              "userInfo": {
                "email": usernameController.text,
                "userType": "patient",
                "uid": currentUser.user!.uid
              },
            })
            // ignore: avoid_print
            .then((_) => print("Added"))
            // ignore: avoid_print
            .catchError((error) => print("Add failed: $error"));

      }
      // ignore: use_build_context_synchronously
      uploadCgmData(context); // Vi kalder funktionen uploadCgmData() for at loade resten af dataen fra en fil
      // Navigate to the home page when authentication is successful.
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return const MyApp();
        }),
      );
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors here
      if (e.code == 'user-not-found') {
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      } else {
        setState(() {
          errorMessage = 'Unknown error: ${e.code}';
        });
      }
      // Dismiss the loading circle when the authentication fails
      // ignore: use_build_context_synchronously
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
                padding: EdgeInsets.only(top: 25, bottom: 50),
                child: Text(
                  "GlucoInsight",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 40,
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Register your account here',
                style: TextStyle(
                  color:  Color.fromRGBO(210, 50, 50, 100),
                  fontSize: 16,
                ),
              ),

              // Username field
              MyTextField(
                controller: usernameController,
                hint: "Username or E-mail",
                inputType: TextInputType.emailAddress,
                isPassword: false,
              ),

              //Password field
              MyTextField(
                controller: passwordController,
                hint: "Password",
                inputType: TextInputType.text,
                isPassword: true,
              ),

              // Confirm password field
              MyTextField(
                controller: confirmPasswordController,
                hint: "Confirm password",
                inputType: TextInputType.text,
                isPassword: true,
              ),
              if (errorMessage.isNotEmpty) // Display error message if not empty
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red, // You can choose the color
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(210, 50, 50, 100),
                  ),
                  onPressed: () {
                    signUserUp(context); // Call the sign-in method
                  },
                  child: const Text(
                    "Sign up",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      " Log in here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
