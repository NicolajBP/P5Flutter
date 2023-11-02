// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/components/MyTextField.dart';
import 'package:p5/main.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

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

        collection
            .doc(currentUser.user!.uid)
            .collection("patientData")
            .doc(yesterdayYYYY_MM_DD)
            .set({
              "cgmData": {
                "0": {
                  "timeStamp": "2021-02-04T00:00:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "1": {
                  "timeStamp": "2021-02-04T00:15:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "2": {
                  "timeStamp": "2021-02-04T00:30:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "3": {
                  "timeStamp": "2021-02-04T00:45:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "4": {
                  "timeStamp": "2021-02-04T01:00:00",
                  "mg/dL": 126,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Løb",
                  "exerciseValue": 126
                },
                "5": {
                  "timeStamp": "2021-02-04T01:15:00",
                  "mg/dL": 135,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "6": {
                  "timeStamp": "2021-02-04T01:30:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "7": {
                  "timeStamp": "2021-02-04T01:45:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "8": {
                  "timeStamp": "2021-02-04T02:00:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "9": {
                  "timeStamp": "2021-02-04T02:15:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "10": {
                  "timeStamp": "2021-02-04T02:30:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "11": {
                  "timeStamp": "2021-02-04T02:45:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "12": {
                  "timeStamp": "2021-02-04T03:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "13": {
                  "timeStamp": "2021-02-04T03:15:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "14": {
                  "timeStamp": "2021-02-04T03:30:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "15": {
                  "timeStamp": "2021-02-04T03:45:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "16": {
                  "timeStamp": "2021-02-04T04:00:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "17": {
                  "timeStamp": "2021-02-04T04:15:00",
                  "mg/dL": 138.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "18": {
                  "timeStamp": "2021-02-04T04:30:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "19": {
                  "timeStamp": "2021-02-04T04:45:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "20": {
                  "timeStamp": "2021-02-04T05:00:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "21": {
                  "timeStamp": "2021-02-04T05:15:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "22": {
                  "timeStamp": "2021-02-04T05:30:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "23": {
                  "timeStamp": "2021-02-04T05:45:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "24": {
                  "timeStamp": "2021-02-04T06:00:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "25": {
                  "timeStamp": "2021-02-04T06:15:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "26": {
                  "timeStamp": "2021-02-04T06:30:00",
                  "mg/dL": 153,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "27": {
                  "timeStamp": "2021-02-04T06:45:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "28": {
                  "timeStamp": "2021-02-04T07:00:00",
                  "mg/dL": 169.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "29": {
                  "timeStamp": "2021-02-04T07:15:00",
                  "mg/dL": 165.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "30": {
                  "timeStamp": "2021-02-04T07:30:00",
                  "mg/dL": 158.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "31": {
                  "timeStamp": "2021-02-04T07:45:00",
                  "mg/dL": 165.6,
                  "nutrientNote": "Steamed bun 120 g\nMilk cereal 100 g",
                  "nutrientValue": 165.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "32": {
                  "timeStamp": "2021-02-04T08:00:00",
                  "mg/dL": 203.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "33": {
                  "timeStamp": "2021-02-04T08:15:00",
                  "mg/dL": 255.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "34": {
                  "timeStamp": "2021-02-04T08:30:00",
                  "mg/dL": 298.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "35": {
                  "timeStamp": "2021-02-04T08:45:00",
                  "mg/dL": 325.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "36": {
                  "timeStamp": "2021-02-04T09:00:00",
                  "mg/dL": 334.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "37": {
                  "timeStamp": "2021-02-04T09:15:00",
                  "mg/dL": 325.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Cykel",
                  "exerciseValue": 325.8
                },
                "38": {
                  "timeStamp": "2021-02-04T09:30:00",
                  "mg/dL": 307.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "39": {
                  "timeStamp": "2021-02-04T09:45:00",
                  "mg/dL": 280.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "40": {
                  "timeStamp": "2021-02-04T10:00:00",
                  "mg/dL": 246.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "41": {
                  "timeStamp": "2021-02-04T10:15:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "42": {
                  "timeStamp": "2021-02-04T10:30:00",
                  "mg/dL": 185.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "43": {
                  "timeStamp": "2021-02-04T10:45:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "44": {
                  "timeStamp": "2021-02-04T11:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "45": {
                  "timeStamp": "2021-02-04T11:15:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "46": {
                  "timeStamp": "2021-02-04T11:30:00",
                  "mg/dL": 133.2,
                  "nutrientNote":
                      "Chicken leg 50 g\nVegetable 55 g\nBean sprout 25 g\nRice 100 g",
                  "nutrientValue": 133.2,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "47": {
                  "timeStamp": "2021-02-04T11:45:00",
                  "mg/dL": 129.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "48": {
                  "timeStamp": "2021-02-04T12:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "49": {
                  "timeStamp": "2021-02-04T12:15:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "50": {
                  "timeStamp": "2021-02-04T12:30:00",
                  "mg/dL": 201.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "51": {
                  "timeStamp": "2021-02-04T12:45:00",
                  "mg/dL": 217.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "52": {
                  "timeStamp": "2021-02-04T13:00:00",
                  "mg/dL": 230.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "53": {
                  "timeStamp": "2021-02-04T13:15:00",
                  "mg/dL": 237.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "54": {
                  "timeStamp": "2021-02-04T13:30:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "55": {
                  "timeStamp": "2021-02-04T13:45:00",
                  "mg/dL": 252,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "56": {
                  "timeStamp": "2021-02-04T14:00:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "57": {
                  "timeStamp": "2021-02-04T14:15:00",
                  "mg/dL": 244.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "58": {
                  "timeStamp": "2021-02-04T14:30:00",
                  "mg/dL": 244.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "59": {
                  "timeStamp": "2021-02-04T14:45:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "60": {
                  "timeStamp": "2021-02-04T15:00:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "61": {
                  "timeStamp": "2021-02-04T15:15:00",
                  "mg/dL": 216,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "62": {
                  "timeStamp": "2021-02-04T15:30:00",
                  "mg/dL": 228.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "63": {
                  "timeStamp": "2021-02-04T15:45:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "64": {
                  "timeStamp": "2021-02-04T16:00:00",
                  "mg/dL": 237.6,
                  "nutrientNote": "Egg 50 g",
                  "nutrientValue": 237.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "65": {
                  "timeStamp": "2021-02-04T16:15:00",
                  "mg/dL": 228.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "66": {
                  "timeStamp": "2021-02-04T16:30:00",
                  "mg/dL": 226.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "67": {
                  "timeStamp": "2021-02-04T16:45:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "68": {
                  "timeStamp": "2021-02-04T17:00:00",
                  "mg/dL": 214.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "69": {
                  "timeStamp": "2021-02-04T17:15:00",
                  "mg/dL": 187.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "70": {
                  "timeStamp": "2021-02-04T17:30:00",
                  "mg/dL": 181.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "71": {
                  "timeStamp": "2021-02-04T17:45:00",
                  "mg/dL": 181.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "72": {
                  "timeStamp": "2021-02-04T18:00:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "73": {
                  "timeStamp": "2021-02-04T18:15:00",
                  "mg/dL": 178.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "74": {
                  "timeStamp": "2021-02-04T18:30:00",
                  "mg/dL": 190.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "75": {
                  "timeStamp": "2021-02-04T18:45:00",
                  "mg/dL": 196.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "76": {
                  "timeStamp": "2021-02-04T19:00:00",
                  "mg/dL": 194.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "77": {
                  "timeStamp": "2021-02-04T19:15:00",
                  "mg/dL": 199.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "78": {
                  "timeStamp": "2021-02-04T19:30:00",
                  "mg/dL": 199.8,
                  "nutrientNote":
                      "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
                  "nutrientValue": 199.8,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "79": {
                  "timeStamp": "2021-02-04T19:45:00",
                  "mg/dL": 192.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "80": {
                  "timeStamp": "2021-02-04T20:00:00",
                  "mg/dL": 196.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "81": {
                  "timeStamp": "2021-02-04T20:15:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "82": {
                  "timeStamp": "2021-02-04T20:30:00",
                  "mg/dL": 221.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "83": {
                  "timeStamp": "2021-02-04T20:45:00",
                  "mg/dL": 201.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "84": {
                  "timeStamp": "2021-02-04T21:00:00",
                  "mg/dL": 169.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "85": {
                  "timeStamp": "2021-02-04T21:15:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "86": {
                  "timeStamp": "2021-02-04T21:30:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "87": {
                  "timeStamp": "2021-02-04T21:45:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "88": {
                  "timeStamp": "2021-02-04T22:00:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "89": {
                  "timeStamp": "2021-02-04T22:15:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "90": {
                  "timeStamp": "2021-02-04T22:30:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "91": {
                  "timeStamp": "2021-02-04T22:45:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "92": {
                  "timeStamp": "2021-02-04T23:00:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "93": {
                  "timeStamp": "2021-02-04T23:15:00",
                  "mg/dL": 163.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "94": {
                  "timeStamp": "2021-02-04T23:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "95": {
                  "timeStamp": "2021-02-04T23:45:00",
                  "mg/dL": 178.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                }
              },
              "exerciseEntries": {
                "0": {"type": "", "intensity": "", "timeStamp": ""},
                "1": {"type": "", "intensity": "", "timeStamp": ""}
              },
            })
            // ignore: avoid_print
            .then((_) => print("Added"))
            // ignore: avoid_print
            .catchError((error) => print("Add failed: $error"));

        collection
            .doc(currentUser.user!.uid)
            .collection("patientData")
            .doc(dateYYYY_MM_DD)
            .set({
              "cgmData": {
                "0": {
                  "timeStamp": "2021-02-05T00:00:00",
                  "mg/dL": 181.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "1": {
                  "timeStamp": "2021-02-05T00:15:00",
                  "mg/dL": 180,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "2": {
                  "timeStamp": "2021-02-05T00:30:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "3": {
                  "timeStamp": "2021-02-05T00:45:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "4": {
                  "timeStamp": "2021-02-05T01:00:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "5": {
                  "timeStamp": "2021-02-05T01:15:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "6": {
                  "timeStamp": "2021-02-05T01:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "7": {
                  "timeStamp": "2021-02-05T01:45:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "8": {
                  "timeStamp": "2021-02-05T02:00:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "9": {
                  "timeStamp": "2021-02-05T02:15:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "10": {
                  "timeStamp": "2021-02-05T02:30:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "11": {
                  "timeStamp": "2021-02-05T02:45:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "12": {
                  "timeStamp": "2021-02-05T03:00:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "13": {
                  "timeStamp": "2021-02-05T03:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "14": {
                  "timeStamp": "2021-02-05T03:30:00",
                  "mg/dL": 163.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "15": {
                  "timeStamp": "2021-02-05T03:45:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "16": {
                  "timeStamp": "2021-02-05T04:00:00",
                  "mg/dL": 158.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "17": {
                  "timeStamp": "2021-02-05T04:15:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "CrossFit",
                  "exerciseValue": 156.6
                },
                "18": {
                  "timeStamp": "2021-02-05T04:30:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "19": {
                  "timeStamp": "2021-02-05T04:45:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "20": {
                  "timeStamp": "2021-02-05T05:00:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "21": {
                  "timeStamp": "2021-02-05T05:15:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "22": {
                  "timeStamp": "2021-02-05T05:30:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Armbøjninger",
                  "exerciseValue": 142.2
                },
                "23": {
                  "timeStamp": "2021-02-05T05:45:00",
                  "mg/dL": 138.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "24": {
                  "timeStamp": "2021-02-05T06:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "25": {
                  "timeStamp": "2021-02-05T06:15:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "26": {
                  "timeStamp": "2021-02-05T06:30:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "27": {
                  "timeStamp": "2021-02-05T06:45:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "28": {
                  "timeStamp": "2021-02-05T07:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "29": {
                  "timeStamp": "2021-02-05T07:15:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "30": {
                  "timeStamp": "2021-02-05T07:30:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "31": {
                  "timeStamp": "2021-02-05T07:45:00",
                  "mg/dL": 138.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "32": {
                  "timeStamp": "2021-02-05T08:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "33": {
                  "timeStamp": "2021-02-05T08:15:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "34": {
                  "timeStamp": "2021-02-05T08:30:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "35": {
                  "timeStamp": "2021-02-05T08:45:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "36": {
                  "timeStamp": "2021-02-05T09:00:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "37": {
                  "timeStamp": "2021-02-05T09:15:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "Croissants 80 g\n Milk cereal 150 g",
                  "nutrientValue": 147.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "38": {
                  "timeStamp": "2021-02-05T09:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "39": {
                  "timeStamp": "2021-02-05T09:45:00",
                  "mg/dL": 219.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "40": {
                  "timeStamp": "2021-02-05T10:00:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "41": {
                  "timeStamp": "2021-02-05T10:15:00",
                  "mg/dL": 239.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "42": {
                  "timeStamp": "2021-02-05T10:30:00",
                  "mg/dL": 223.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "43": {
                  "timeStamp": "2021-02-05T10:45:00",
                  "mg/dL": 214.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "44": {
                  "timeStamp": "2021-02-05T11:00:00",
                  "mg/dL": 216,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "45": {
                  "timeStamp": "2021-02-05T11:15:00",
                  "mg/dL": 203.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "46": {
                  "timeStamp": "2021-02-05T11:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "47": {
                  "timeStamp": "2021-02-05T11:45:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "48": {
                  "timeStamp": "2021-02-05T12:00:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "49": {
                  "timeStamp": "2021-02-05T12:15:00",
                  "mg/dL": 151.2,
                  "nutrientNote":
                      "Steamed yellow croaker 50 g\n Vegetable 56 g\n Tofu 20 g\n Bullfrog 100 g\n Steamed sponge cake 40 g",
                  "nutrientValue": 151.2,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "50": {
                  "timeStamp": "2021-02-05T12:30:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "51": {
                  "timeStamp": "2021-02-05T12:45:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "52": {
                  "timeStamp": "2021-02-05T13:00:00",
                  "mg/dL": 158.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "53": {
                  "timeStamp": "2021-02-05T13:15:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "54": {
                  "timeStamp": "2021-02-05T13:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "55": {
                  "timeStamp": "2021-02-05T13:45:00",
                  "mg/dL": 187.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "56": {
                  "timeStamp": "2021-02-05T14:00:00",
                  "mg/dL": 198,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "57": {
                  "timeStamp": "2021-02-05T14:15:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "58": {
                  "timeStamp": "2021-02-05T14:30:00",
                  "mg/dL": 223.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "59": {
                  "timeStamp": "2021-02-05T14:45:00",
                  "mg/dL": 230.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "60": {
                  "timeStamp": "2021-02-05T15:00:00",
                  "mg/dL": 232.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "61": {
                  "timeStamp": "2021-02-05T15:15:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "62": {
                  "timeStamp": "2021-02-05T15:30:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "63": {
                  "timeStamp": "2021-02-05T15:45:00",
                  "mg/dL": 199.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "64": {
                  "timeStamp": "2021-02-05T16:00:00",
                  "mg/dL": 183.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "65": {
                  "timeStamp": "2021-02-05T16:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "66": {
                  "timeStamp": "2021-02-05T16:30:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "67": {
                  "timeStamp": "2021-02-05T16:45:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "68": {
                  "timeStamp": "2021-02-05T17:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "69": {
                  "timeStamp": "2021-02-05T17:15:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "70": {
                  "timeStamp": "2021-02-05T17:30:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "71": {
                  "timeStamp": "2021-02-05T17:45:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "72": {
                  "timeStamp": "2021-02-05T18:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "73": {
                  "timeStamp": "2021-02-05T18:15:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "74": {
                  "timeStamp": "2021-02-05T18:30:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "75": {
                  "timeStamp": "2021-02-05T18:45:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "76": {
                  "timeStamp": "2021-02-05T19:00:00",
                  "mg/dL": 163.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "77": {
                  "timeStamp": "2021-02-05T19:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "78": {
                  "timeStamp": "2021-02-05T19:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "Rice cake 100 g\n Vegetable 50 g",
                  "nutrientValue": 174.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "79": {
                  "timeStamp": "2021-02-05T19:45:00",
                  "mg/dL": 192.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "80": {
                  "timeStamp": "2021-02-05T20:00:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "81": {
                  "timeStamp": "2021-02-05T20:15:00",
                  "mg/dL": 226.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "82": {
                  "timeStamp": "2021-02-05T20:30:00",
                  "mg/dL": 230.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "83": {
                  "timeStamp": "2021-02-05T20:45:00",
                  "mg/dL": 235.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "84": {
                  "timeStamp": "2021-02-05T21:00:00",
                  "mg/dL": 234,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "85": {
                  "timeStamp": "2021-02-05T21:15:00",
                  "mg/dL": 232.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "86": {
                  "timeStamp": "2021-02-05T21:30:00",
                  "mg/dL": 239.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "87": {
                  "timeStamp": "2021-02-05T21:45:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "88": {
                  "timeStamp": "2021-02-05T22:00:00",
                  "mg/dL": 243,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "89": {
                  "timeStamp": "2021-02-05T22:15:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "90": {
                  "timeStamp": "2021-02-05T22:30:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "91": {
                  "timeStamp": "2021-02-05T22:45:00",
                  "mg/dL": 244.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "92": {
                  "timeStamp": "2021-02-05T23:00:00",
                  "mg/dL": 235.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "93": {
                  "timeStamp": "2021-02-05T23:15:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "94": {
                  "timeStamp": "2021-02-05T23:30:00",
                  "mg/dL": 221.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "95": {
                  "timeStamp": "2021-02-05T23:45:00",
                  "mg/dL": 216,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                }
              },
              "exerciseEntries": {
                "0": {"type": "", "intensity": "", "timeStamp": ""},
                "1": {"type": "", "intensity": "", "timeStamp": ""}
              },
            })
            // ignore: avoid_print
            .then((_) => print("Added"))
            // ignore: avoid_print
            .catchError((error) => print("Add failed: $error"));

        collection
            .doc(currentUser.user!.uid)
            .collection("patientData")
            .doc(tomorrowYYYY_MM_DD)
            .set({
              "cgmData": {
                "0": {
                  "timeStamp": "2021-02-05T00:00:00",
                  "mg/dL": 181.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "1": {
                  "timeStamp": "2021-02-05T00:15:00",
                  "mg/dL": 180,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "2": {
                  "timeStamp": "2021-02-05T00:30:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "3": {
                  "timeStamp": "2021-02-05T00:45:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "4": {
                  "timeStamp": "2021-02-05T01:00:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "5": {
                  "timeStamp": "2021-02-05T01:15:00",
                  "mg/dL": 176.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "6": {
                  "timeStamp": "2021-02-05T01:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "7": {
                  "timeStamp": "2021-02-05T01:45:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "8": {
                  "timeStamp": "2021-02-05T02:00:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "9": {
                  "timeStamp": "2021-02-05T02:15:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "10": {
                  "timeStamp": "2021-02-05T02:30:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "11": {
                  "timeStamp": "2021-02-05T02:45:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "12": {
                  "timeStamp": "2021-02-05T03:00:00",
                  "mg/dL": 172.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "13": {
                  "timeStamp": "2021-02-05T03:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "14": {
                  "timeStamp": "2021-02-05T03:30:00",
                  "mg/dL": 163.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "15": {
                  "timeStamp": "2021-02-05T03:45:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "16": {
                  "timeStamp": "2021-02-05T04:00:00",
                  "mg/dL": 158.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "17": {
                  "timeStamp": "2021-02-05T04:15:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "18": {
                  "timeStamp": "2021-02-05T04:30:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "19": {
                  "timeStamp": "2021-02-05T04:45:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "20": {
                  "timeStamp": "2021-02-05T05:00:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "21": {
                  "timeStamp": "2021-02-05T05:15:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "22": {
                  "timeStamp": "2021-02-05T05:30:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "23": {
                  "timeStamp": "2021-02-05T05:45:00",
                  "mg/dL": 138.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "24": {
                  "timeStamp": "2021-02-05T06:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "25": {
                  "timeStamp": "2021-02-05T06:15:00",
                  "mg/dL": 140.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "26": {
                  "timeStamp": "2021-02-05T06:30:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "27": {
                  "timeStamp": "2021-02-05T06:45:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "28": {
                  "timeStamp": "2021-02-05T07:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "29": {
                  "timeStamp": "2021-02-05T07:15:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "30": {
                  "timeStamp": "2021-02-05T07:30:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "31": {
                  "timeStamp": "2021-02-05T07:45:00",
                  "mg/dL": 138.6,
                  "nutrientNote":
                      "Croissants 80 g\n Milk cereal with notoginseng powder 150 g",
                  "nutrientValue": 138.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "32": {
                  "timeStamp": "2021-02-05T08:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "33": {
                  "timeStamp": "2021-02-05T08:15:00",
                  "mg/dL": 142.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "34": {
                  "timeStamp": "2021-02-05T08:30:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "35": {
                  "timeStamp": "2021-02-05T08:45:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "36": {
                  "timeStamp": "2021-02-05T09:00:00",
                  "mg/dL": 149.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "37": {
                  "timeStamp": "2021-02-05T09:15:00",
                  "mg/dL": 147.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "38": {
                  "timeStamp": "2021-02-05T09:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "39": {
                  "timeStamp": "2021-02-05T09:45:00",
                  "mg/dL": 219.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "40": {
                  "timeStamp": "2021-02-05T10:00:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "41": {
                  "timeStamp": "2021-02-05T10:15:00",
                  "mg/dL": 239.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "42": {
                  "timeStamp": "2021-02-05T10:30:00",
                  "mg/dL": 223.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "43": {
                  "timeStamp": "2021-02-05T10:45:00",
                  "mg/dL": 214.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "44": {
                  "timeStamp": "2021-02-05T11:00:00",
                  "mg/dL": 216,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "45": {
                  "timeStamp": "2021-02-05T11:15:00",
                  "mg/dL": 203.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "46": {
                  "timeStamp": "2021-02-05T11:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote":
                      "Rice 100 g\n Chicken nugget 50 g\n Potato 58 g",
                  "nutrientValue": 174.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "47": {
                  "timeStamp": "2021-02-05T11:45:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "48": {
                  "timeStamp": "2021-02-05T12:00:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "49": {
                  "timeStamp": "2021-02-05T12:15:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "50": {
                  "timeStamp": "2021-02-05T12:30:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Fisketur",
                  "exerciseValue": 154.8
                },
                "51": {
                  "timeStamp": "2021-02-05T12:45:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "52": {
                  "timeStamp": "2021-02-05T13:00:00",
                  "mg/dL": 158.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "53": {
                  "timeStamp": "2021-02-05T13:15:00",
                  "mg/dL": 160.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "54": {
                  "timeStamp": "2021-02-05T13:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "55": {
                  "timeStamp": "2021-02-05T13:45:00",
                  "mg/dL": 187.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "56": {
                  "timeStamp": "2021-02-05T14:00:00",
                  "mg/dL": 198,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "57": {
                  "timeStamp": "2021-02-05T14:15:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Svømning",
                  "exerciseValue": 212.4
                },
                "58": {
                  "timeStamp": "2021-02-05T14:30:00",
                  "mg/dL": 223.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "59": {
                  "timeStamp": "2021-02-05T14:45:00",
                  "mg/dL": 230.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "60": {
                  "timeStamp": "2021-02-05T15:00:00",
                  "mg/dL": 232.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "61": {
                  "timeStamp": "2021-02-05T15:15:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Gåtur",
                  "exerciseValue": 225
                },
                "62": {
                  "timeStamp": "2021-02-05T15:30:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "63": {
                  "timeStamp": "2021-02-05T15:45:00",
                  "mg/dL": 199.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "64": {
                  "timeStamp": "2021-02-05T16:00:00",
                  "mg/dL": 183.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "65": {
                  "timeStamp": "2021-02-05T16:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "66": {
                  "timeStamp": "2021-02-05T16:30:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "Klatring",
                  "exerciseValue": 156.6
                },
                "67": {
                  "timeStamp": "2021-02-05T16:45:00",
                  "mg/dL": 154.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "68": {
                  "timeStamp": "2021-02-05T17:00:00",
                  "mg/dL": 145.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "69": {
                  "timeStamp": "2021-02-05T17:15:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "70": {
                  "timeStamp": "2021-02-05T17:30:00",
                  "mg/dL": 133.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "71": {
                  "timeStamp": "2021-02-05T17:45:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "72": {
                  "timeStamp": "2021-02-05T18:00:00",
                  "mg/dL": 136.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "73": {
                  "timeStamp": "2021-02-05T18:15:00",
                  "mg/dL": 144,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "74": {
                  "timeStamp": "2021-02-05T18:30:00",
                  "mg/dL": 151.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "75": {
                  "timeStamp": "2021-02-05T18:45:00",
                  "mg/dL": 156.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "76": {
                  "timeStamp": "2021-02-05T19:00:00",
                  "mg/dL": 163.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "77": {
                  "timeStamp": "2021-02-05T19:15:00",
                  "mg/dL": 167.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "78": {
                  "timeStamp": "2021-02-05T19:30:00",
                  "mg/dL": 174.6,
                  "nutrientNote":
                      "Coarse grain 50 g\n Scrambled egg with tomato 50 g\n Braised fish 50 g\n Green vegetable 30 g",
                  "nutrientValue": 174.6,
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "79": {
                  "timeStamp": "2021-02-05T19:45:00",
                  "mg/dL": 192.6,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "80": {
                  "timeStamp": "2021-02-05T20:00:00",
                  "mg/dL": 212.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "81": {
                  "timeStamp": "2021-02-05T20:15:00",
                  "mg/dL": 226.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "82": {
                  "timeStamp": "2021-02-05T20:30:00",
                  "mg/dL": 230.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "83": {
                  "timeStamp": "2021-02-05T20:45:00",
                  "mg/dL": 235.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "84": {
                  "timeStamp": "2021-02-05T21:00:00",
                  "mg/dL": 234,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "85": {
                  "timeStamp": "2021-02-05T21:15:00",
                  "mg/dL": 232.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "86": {
                  "timeStamp": "2021-02-05T21:30:00",
                  "mg/dL": 239.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "87": {
                  "timeStamp": "2021-02-05T21:45:00",
                  "mg/dL": 241.2,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "88": {
                  "timeStamp": "2021-02-05T22:00:00",
                  "mg/dL": 243,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "89": {
                  "timeStamp": "2021-02-05T22:15:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "90": {
                  "timeStamp": "2021-02-05T22:30:00",
                  "mg/dL": 248.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "91": {
                  "timeStamp": "2021-02-05T22:45:00",
                  "mg/dL": 244.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "92": {
                  "timeStamp": "2021-02-05T23:00:00",
                  "mg/dL": 235.8,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "93": {
                  "timeStamp": "2021-02-05T23:15:00",
                  "mg/dL": 225,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "94": {
                  "timeStamp": "2021-02-05T23:30:00",
                  "mg/dL": 221.4,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                },
                "95": {
                  "timeStamp": "2021-02-05T23:45:00",
                  "mg/dL": 216,
                  "nutrientNote": "",
                  "nutrientValue": "",
                  "exerciseNote": "",
                  "exerciseValue": ""
                }
              },
              "exerciseEntries": {
                "0": {"type": "", "intensity": "", "timeStamp": ""},
                "1": {"type": "", "intensity": "", "timeStamp": ""}
              },
            })
            // ignore: avoid_print
            .then((_) => print("Added"))
            // ignore: avoid_print
            .catchError((error) => print("Add failed: $error"));
      } else {
        // show error message "passwords dont match"
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      }

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
                  style: const TextStyle(
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
