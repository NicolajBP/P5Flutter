// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/components/MyTextField.dart';
import 'package:p5/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime now = DateTime.now();
String dateYYYY_MM_DD = now.toString().substring(0, 10);

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
            .then((_) => print("Added"))
            .catchError((error) => print("Add failed: $error"));

        collection
            .doc(currentUser.user!.uid)
            .collection("patientData")
            .doc(dateYYYY_MM_DD)
            .set({
              // Tilføjer attributter
              "cgmData": {
                "0": {"mg/dL": 154.8, "timeStamp": "04-02-2021  00:00:00"},
                "1": 147.6,
                "2": 100.0, // IKKE DEN RIGTIGE VÆRDI, INDSÆT KORREKT
                "3": 145.8,
                "4": 133.2,
                "5": 126.0,
                "6": 135.0,
                "7": 147.6,
                "8": 142.2,
                "9": 140.4,
                "10": 149.4,
                "11": 145.8,
                "12": 136.8,
                "13": 145.8,
                "14": 149.4,
                "15": 145.8,
                "16": 142.2,
                "17": 140.4,
                "18": 138.6,
                "19": 145.8,
                "20": 147.6,
              },
              "exerciseEntries": {
                "0": {"type": "", "intensity": "", "timeStamp": ""},
                "1": {"type": "", "intensity": "", "timeStamp": ""}
              },
            })
            .then((_) => print("Added"))
            .catchError((error) => print("Add failed: $error"));
      } else {
        // show error message "passwords dont match"
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      }
      // Navigate to the home page when authentication is successful.
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
                  "My Diabuddy",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Register your account here',
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 172, 10),
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
                      " Login here",
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
