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
              // "cgmData": {
              //   "0": {"mg/dL": 154.8, "timeStamp": "04-02-2021  00:00:00"},
              //   "1": 147.6,
              //   "2": 100.0, // IKKE DEN RIGTIGE VÆRDI, INDSÆT KORREKT
              //   "3": 145.8,
              //   "4": 133.2,
              //   "5": 126.0,
              //   "6": 135.0,
              //   "7": 147.6,
              //   "8": 142.2,
              //   "9": 140.4,
              //   "10": 149.4,
              //   "11": 145.8,
              //   "12": 136.8,
              //   "13": 145.8,
              //   "14": 149.4,
              //   "15": 145.8,
              //   "16": 142.2,
              //   "17": 140.4,
              //   "18": 138.6,
              //   "19": 145.8,
              //   "20": 147.6,
              // },
              "cgmData": {
                "0": {"timeStamp": "2021-02-04T00:00:00", "mg/dL": 154.8},
                "1": {"timeStamp": "2021-02-04T00:15:00", "mg/dL": 147.6},
                "2": {"timeStamp": "2021-02-04T00:30:00", "mg/dL": 145.8},
                "3": {"timeStamp": "2021-02-04T00:45:00", "mg/dL": 133.2},
                "4": {"timeStamp": "2021-02-04T01:00:00", "mg/dL": 126},
                "5": {"timeStamp": "2021-02-04T01:15:00", "mg/dL": 135},
                "6": {"timeStamp": "2021-02-04T01:30:00", "mg/dL": 147.6},
                "7": {"timeStamp": "2021-02-04T01:45:00", "mg/dL": 142.2},
                "8": {"timeStamp": "2021-02-04T02:00:00", "mg/dL": 140.4},
                "9": {"timeStamp": "2021-02-04T02:15:00", "mg/dL": 149.4},
                "10": {"timeStamp": "2021-02-04T02:30:00", "mg/dL": 145.8},
                "11": {"timeStamp": "2021-02-04T02:45:00", "mg/dL": 136.8},
                "12": {"timeStamp": "2021-02-04T03:00:00", "mg/dL": 145.8},
                "13": {"timeStamp": "2021-02-04T03:15:00", "mg/dL": 149.4},
                "14": {"timeStamp": "2021-02-04T03:30:00", "mg/dL": 145.8},
                "15": {"timeStamp": "2021-02-04T03:45:00", "mg/dL": 142.2},
                "16": {"timeStamp": "2021-02-04T04:00:00", "mg/dL": 140.4},
                "17": {"timeStamp": "2021-02-04T04:15:00", "mg/dL": 138.6},
                "18": {"timeStamp": "2021-02-04T04:30:00", "mg/dL": 145.8},
                "19": {"timeStamp": "2021-02-04T04:45:00", "mg/dL": 147.6},
                "20": {"timeStamp": "2021-02-04T05:00:00", "mg/dL": 144},
                "21": {"timeStamp": "2021-02-04T05:15:00", "mg/dL": 140.4},
                "22": {"timeStamp": "2021-02-04T05:30:00", "mg/dL": 136.8},
                "23": {"timeStamp": "2021-02-04T05:45:00", "mg/dL": 144},
                "24": {"timeStamp": "2021-02-04T06:00:00", "mg/dL": 149.4},
                "25": {"timeStamp": "2021-02-04T06:15:00", "mg/dL": 145.8},
                "26": {"timeStamp": "2021-02-04T06:30:00", "mg/dL": 153},
                "27": {"timeStamp": "2021-02-04T06:45:00", "mg/dL": 167.4},
                "28": {"timeStamp": "2021-02-04T07:00:00", "mg/dL": 169.2},
                "29": {"timeStamp": "2021-02-04T07:15:00", "mg/dL": 165.6},
                "30": {"timeStamp": "2021-02-04T07:30:00", "mg/dL": 158.4},
                "31": {"timeStamp": "2021-02-04T07:45:00", "mg/dL": 165.6},
                "32": {"timeStamp": "2021-02-04T08:00:00", "mg/dL": 203.4},
                "33": {"timeStamp": "2021-02-04T08:15:00", "mg/dL": 255.6},
                "34": {"timeStamp": "2021-02-04T08:30:00", "mg/dL": 298.8},
                "35": {"timeStamp": "2021-02-04T08:45:00", "mg/dL": 325.8},
                "36": {"timeStamp": "2021-02-04T09:00:00", "mg/dL": 334.8},
                "37": {"timeStamp": "2021-02-04T09:15:00", "mg/dL": 325.8},
                "38": {"timeStamp": "2021-02-04T09:30:00", "mg/dL": 307.8},
                "39": {"timeStamp": "2021-02-04T09:45:00", "mg/dL": 280.8},
                "40": {"timeStamp": "2021-02-04T10:00:00", "mg/dL": 246.6},
                "41": {"timeStamp": "2021-02-04T10:15:00", "mg/dL": 212.4},
                "42": {"timeStamp": "2021-02-04T10:30:00", "mg/dL": 185.4},
                "43": {"timeStamp": "2021-02-04T10:45:00", "mg/dL": 160.2},
                "44": {"timeStamp": "2021-02-04T11:00:00", "mg/dL": 145.8},
                "45": {"timeStamp": "2021-02-04T11:15:00", "mg/dL": 140.4},
                "46": {"timeStamp": "2021-02-04T11:30:00", "mg/dL": 133.2},
                "47": {"timeStamp": "2021-02-04T11:45:00", "mg/dL": 129.6},
                "48": {"timeStamp": "2021-02-04T12:00:00", "mg/dL": 145.8},
                "49": {"timeStamp": "2021-02-04T12:15:00", "mg/dL": 174.6},
                "50": {"timeStamp": "2021-02-04T12:30:00", "mg/dL": 201.6},
                "51": {"timeStamp": "2021-02-04T12:45:00", "mg/dL": 217.8},
                "52": {"timeStamp": "2021-02-04T13:00:00", "mg/dL": 230.4},
                "53": {"timeStamp": "2021-02-04T13:15:00", "mg/dL": 237.6},
                "54": {"timeStamp": "2021-02-04T13:30:00", "mg/dL": 248.4},
                "55": {"timeStamp": "2021-02-04T13:45:00", "mg/dL": 252},
                "56": {"timeStamp": "2021-02-04T14:00:00", "mg/dL": 248.4},
                "57": {"timeStamp": "2021-02-04T14:15:00", "mg/dL": 244.8},
                "58": {"timeStamp": "2021-02-04T14:30:00", "mg/dL": 244.8},
                "59": {"timeStamp": "2021-02-04T14:45:00", "mg/dL": 241.2},
                "60": {"timeStamp": "2021-02-04T15:00:00", "mg/dL": 225},
                "61": {"timeStamp": "2021-02-04T15:15:00", "mg/dL": 216},
                "62": {"timeStamp": "2021-02-04T15:30:00", "mg/dL": 228.6},
                "63": {"timeStamp": "2021-02-04T15:45:00", "mg/dL": 241.2},
                "64": {"timeStamp": "2021-02-04T16:00:00", "mg/dL": 237.6},
                "65": {"timeStamp": "2021-02-04T16:15:00", "mg/dL": 228.6},
                "66": {"timeStamp": "2021-02-04T16:30:00", "mg/dL": 226.8},
                "67": {"timeStamp": "2021-02-04T16:45:00", "mg/dL": 225},
                "68": {"timeStamp": "2021-02-04T17:00:00", "mg/dL": 214.2},
                "69": {"timeStamp": "2021-02-04T17:15:00", "mg/dL": 187.2},
                "70": {"timeStamp": "2021-02-04T17:30:00", "mg/dL": 181.8},
                "71": {"timeStamp": "2021-02-04T17:45:00", "mg/dL": 181.8},
                "72": {"timeStamp": "2021-02-04T18:00:00", "mg/dL": 176.4},
                "73": {"timeStamp": "2021-02-04T18:15:00", "mg/dL": 178.2},
                "74": {"timeStamp": "2021-02-04T18:30:00", "mg/dL": 190.8},
                "75": {"timeStamp": "2021-02-04T18:45:00", "mg/dL": 196.2},
                "76": {"timeStamp": "2021-02-04T19:00:00", "mg/dL": 194.4},
                "77": {"timeStamp": "2021-02-04T19:15:00", "mg/dL": 199.8},
                "78": {"timeStamp": "2021-02-04T19:30:00", "mg/dL": 199.8},
                "79": {"timeStamp": "2021-02-04T19:45:00", "mg/dL": 192.6},
                "80": {"timeStamp": "2021-02-04T20:00:00", "mg/dL": 196.2},
                "81": {"timeStamp": "2021-02-04T20:15:00", "mg/dL": 212.4},
                "82": {"timeStamp": "2021-02-04T20:30:00", "mg/dL": 221.4},
                "83": {"timeStamp": "2021-02-04T20:45:00", "mg/dL": 201.6},
                "84": {"timeStamp": "2021-02-04T21:00:00", "mg/dL": 169.2},
                "85": {"timeStamp": "2021-02-04T21:15:00", "mg/dL": 142.2},
                "86": {"timeStamp": "2021-02-04T21:30:00", "mg/dL": 133.2},
                "87": {"timeStamp": "2021-02-04T21:45:00", "mg/dL": 140.4},
                "88": {"timeStamp": "2021-02-04T22:00:00", "mg/dL": 147.6},
                "89": {"timeStamp": "2021-02-04T22:15:00", "mg/dL": 147.6},
                "90": {"timeStamp": "2021-02-04T22:30:00", "mg/dL": 147.6},
                "91": {"timeStamp": "2021-02-04T22:45:00", "mg/dL": 149.4},
                "92": {"timeStamp": "2021-02-04T23:00:00", "mg/dL": 151.2},
                "93": {"timeStamp": "2021-02-04T23:15:00", "mg/dL": 163.8},
                "94": {"timeStamp": "2021-02-04T23:30:00", "mg/dL": 174.6},
                "95": {"timeStamp": "2021-02-04T23:45:00", "mg/dL": 178.2},
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
