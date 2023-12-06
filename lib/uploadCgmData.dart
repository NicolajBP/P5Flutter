// import 'dart:ffi';

// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:p5/components/MyTextField.dart';
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
final user = FirebaseAuth.instance.currentUser!;

Future<void> uploadCgmData(BuildContext context) async {
  var collection = FirebaseFirestore.instance.collection("users");
  // bool showcircle = true;

  // showDialog(
  //   context: context,
  //   builder: (context) {
  //     return Center(
  //       child: Visibility(
  //         visible: showcircle,
  //         child: CircularProgressIndicator(),
  //       ),
  //     );
  //   },
  // );

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 7))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
      .set({
        "cgmData": {
          "0": {
            "timeStamp": "2021-02-04T00:00:00",
            "mg/dL": 154.9,
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
            "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 6))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
            "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 5))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 4))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
            "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 3))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
            "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 2))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .subtract(const Duration(days: 1))
          .toString()
          .substring(0, 10)) // Kigger en dag tilbage
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
            "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
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
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));

  collection
      .doc(user.uid)
      .collection("patientData")
      .doc(now
          .add(const Duration(days: 1))
          .toString()
          .substring(0, 10)) // Kigger en dag frem
      .set({
        "cgmData": {
          "0": {
            "timeStamp": "2021-02-06T00:00:00",
            "mg/dL": 212.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "1": {
            "timeStamp": "2021-02-06T00:15:00",
            "mg/dL": 214.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "2": {
            "timeStamp": "2021-02-06T00:30:00",
            "mg/dL": 212.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "3": {
            "timeStamp": "2021-02-06T00:45:00",
            "mg/dL": 203.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "4": {
            "timeStamp": "2021-02-06T01:00:00",
            "mg/dL": 190.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "5": {
            "timeStamp": "2021-02-06T01:15:00",
            "mg/dL": 187.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "6": {
            "timeStamp": "2021-02-06T01:30:00",
            "mg/dL": 181.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "7": {
            "timeStamp": "2021-02-06T01:45:00",
            "mg/dL": 172.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "8": {
            "timeStamp": "2021-02-06T02:00:00",
            "mg/dL": 178.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "9": {
            "timeStamp": "2021-02-06T02:15:00",
            "mg/dL": 185.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "10": {
            "timeStamp": "2021-02-06T02:30:00",
            "mg/dL": 187.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "11": {
            "timeStamp": "2021-02-06T02:45:00",
            "mg/dL": 185.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "12": {
            "timeStamp": "2021-02-06T03:00:00",
            "mg/dL": 178.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "13": {
            "timeStamp": "2021-02-06T03:15:00",
            "mg/dL": 167.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "14": {
            "timeStamp": "2021-02-06T03:30:00",
            "mg/dL": 163.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "15": {
            "timeStamp": "2021-02-06T03:45:00",
            "mg/dL": 171,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "16": {
            "timeStamp": "2021-02-06T04:00:00",
            "mg/dL": 181.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "17": {
            "timeStamp": "2021-02-06T04:15:00",
            "mg/dL": 183.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "18": {
            "timeStamp": "2021-02-06T04:30:00",
            "mg/dL": 171,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "19": {
            "timeStamp": "2021-02-06T04:45:00",
            "mg/dL": 158.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "20": {
            "timeStamp": "2021-02-06T05:00:00",
            "mg/dL": 156.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "21": {
            "timeStamp": "2021-02-06T05:15:00",
            "mg/dL": 151.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "22": {
            "timeStamp": "2021-02-06T05:30:00",
            "mg/dL": 154.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "23": {
            "timeStamp": "2021-02-06T05:45:00",
            "mg/dL": 158.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "24": {
            "timeStamp": "2021-02-06T06:00:00",
            "mg/dL": 156.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "25": {
            "timeStamp": "2021-02-06T06:15:00",
            "mg/dL": 151.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "26": {
            "timeStamp": "2021-02-06T06:30:00",
            "mg/dL": 154.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "27": {
            "timeStamp": "2021-02-06T06:45:00",
            "mg/dL": 163.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "28": {
            "timeStamp": "2021-02-06T07:00:00",
            "mg/dL": 167.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "29": {
            "timeStamp": "2021-02-06T07:15:00",
            "mg/dL": 158.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "30": {
            "timeStamp": "2021-02-06T07:30:00",
            "mg/dL": 151.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "31": {
            "timeStamp": "2021-02-06T07:45:00",
            "mg/dL": 154.8,
            "nutrientNote":
                "Croissants 80 g\n Milk cereal with notoginseng powder 150 g",
            "nutrientValue": 154.8,
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "32": {
            "timeStamp": "2021-02-06T08:00:00",
            "mg/dL": 171,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "33": {
            "timeStamp": "2021-02-06T08:15:00",
            "mg/dL": 205.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "34": {
            "timeStamp": "2021-02-06T08:30:00",
            "mg/dL": 228.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "35": {
            "timeStamp": "2021-02-06T08:45:00",
            "mg/dL": 232.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "36": {
            "timeStamp": "2021-02-06T09:00:00",
            "mg/dL": 230.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "37": {
            "timeStamp": "2021-02-06T09:15:00",
            "mg/dL": 223.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "38": {
            "timeStamp": "2021-02-06T09:30:00",
            "mg/dL": 210.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "39": {
            "timeStamp": "2021-02-06T09:45:00",
            "mg/dL": 199.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "40": {
            "timeStamp": "2021-02-06T10:00:00",
            "mg/dL": 192.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "41": {
            "timeStamp": "2021-02-06T10:15:00",
            "mg/dL": 190.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "42": {
            "timeStamp": "2021-02-06T10:30:00",
            "mg/dL": 189,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "43": {
            "timeStamp": "2021-02-06T10:45:00",
            "mg/dL": 183.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "44": {
            "timeStamp": "2021-02-06T11:00:00",
            "mg/dL": 180,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "45": {
            "timeStamp": "2021-02-06T11:15:00",
            "mg/dL": 176.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "46": {
            "timeStamp": "2021-02-06T11:30:00",
            "mg/dL": 167.4,
            "nutrientNote": "Rice 100 g\n Chicken nugget 50 g\n Potato 58 g",
            "nutrientValue": 167.4,
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "47": {
            "timeStamp": "2021-02-06T11:45:00",
            "mg/dL": 163.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "48": {
            "timeStamp": "2021-02-06T12:00:00",
            "mg/dL": 181.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "49": {
            "timeStamp": "2021-02-06T12:15:00",
            "mg/dL": 212.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "50": {
            "timeStamp": "2021-02-06T12:30:00",
            "mg/dL": 244.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "Fisketur",
            "exerciseValue": 244.8
          },
          "51": {
            "timeStamp": "2021-02-06T12:45:00",
            "mg/dL": 271.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "52": {
            "timeStamp": "2021-02-06T13:00:00",
            "mg/dL": 284.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "53": {
            "timeStamp": "2021-02-06T13:15:00",
            "mg/dL": 293.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "54": {
            "timeStamp": "2021-02-06T13:30:00",
            "mg/dL": 300.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "55": {
            "timeStamp": "2021-02-06T13:45:00",
            "mg/dL": 298.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "56": {
            "timeStamp": "2021-02-06T14:00:00",
            "mg/dL": 293.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "57": {
            "timeStamp": "2021-02-06T14:15:00",
            "mg/dL": 289.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "Svømning",
            "exerciseValue": 289.8
          },
          "58": {
            "timeStamp": "2021-02-06T14:30:00",
            "mg/dL": 286.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "59": {
            "timeStamp": "2021-02-06T14:45:00",
            "mg/dL": 280.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "60": {
            "timeStamp": "2021-02-06T15:00:00",
            "mg/dL": 275.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "61": {
            "timeStamp": "2021-02-06T15:15:00",
            "mg/dL": 266.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "Gåtur",
            "exerciseValue": 266.4
          },
          "62": {
            "timeStamp": "2021-02-06T15:30:00",
            "mg/dL": 262.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "63": {
            "timeStamp": "2021-02-06T15:45:00",
            "mg/dL": 261,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "64": {
            "timeStamp": "2021-02-06T16:00:00",
            "mg/dL": 252,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "65": {
            "timeStamp": "2021-02-06T16:15:00",
            "mg/dL": 237.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "66": {
            "timeStamp": "2021-02-06T16:30:00",
            "mg/dL": 225,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "Klatring",
            "exerciseValue": 225
          },
          "67": {
            "timeStamp": "2021-02-06T16:45:00",
            "mg/dL": 217.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "68": {
            "timeStamp": "2021-02-06T17:00:00",
            "mg/dL": 205.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "69": {
            "timeStamp": "2021-02-06T17:15:00",
            "mg/dL": 196.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "70": {
            "timeStamp": "2021-02-06T17:30:00",
            "mg/dL": 194.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "71": {
            "timeStamp": "2021-02-06T17:45:00",
            "mg/dL": 196.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "72": {
            "timeStamp": "2021-02-06T18:00:00",
            "mg/dL": 192.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "73": {
            "timeStamp": "2021-02-06T18:15:00",
            "mg/dL": 180,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "74": {
            "timeStamp": "2021-02-06T18:30:00",
            "mg/dL": 174.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "75": {
            "timeStamp": "2021-02-06T18:45:00",
            "mg/dL": 178.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "76": {
            "timeStamp": "2021-02-06T19:00:00",
            "mg/dL": 189,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "77": {
            "timeStamp": "2021-02-06T19:15:00",
            "mg/dL": 194.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "78": {
            "timeStamp": "2021-02-06T19:30:00",
            "mg/dL": 185.4,
            "nutrientNote":
                "Coarse grain 50 g\n Scrambled egg with tomato 50 g\n Braised fish 50 g\n Green vegetable 30 g",
            "nutrientValue": 185.4,
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "79": {
            "timeStamp": "2021-02-06T19:45:00",
            "mg/dL": 180,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "80": {
            "timeStamp": "2021-02-06T20:00:00",
            "mg/dL": 181.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "81": {
            "timeStamp": "2021-02-06T20:15:00",
            "mg/dL": 183.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "82": {
            "timeStamp": "2021-02-06T20:30:00",
            "mg/dL": 185.4,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "83": {
            "timeStamp": "2021-02-06T20:45:00",
            "mg/dL": 192.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "84": {
            "timeStamp": "2021-02-06T21:00:00",
            "mg/dL": 199.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "85": {
            "timeStamp": "2021-02-06T21:15:00",
            "mg/dL": 201.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "86": {
            "timeStamp": "2021-02-06T21:30:00",
            "mg/dL": 199.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "87": {
            "timeStamp": "2021-02-06T21:45:00",
            "mg/dL": 198,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "88": {
            "timeStamp": "2021-02-06T22:00:00",
            "mg/dL": 196.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "89": {
            "timeStamp": "2021-02-06T22:15:00",
            "mg/dL": 207,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "90": {
            "timeStamp": "2021-02-06T22:30:00",
            "mg/dL": 223.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "91": {
            "timeStamp": "2021-02-06T22:45:00",
            "mg/dL": 235.8,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "92": {
            "timeStamp": "2021-02-06T23:00:00",
            "mg/dL": 241.2,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "93": {
            "timeStamp": "2021-02-06T23:15:00",
            "mg/dL": 246.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "94": {
            "timeStamp": "2021-02-06T23:30:00",
            "mg/dL": 252,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          },
          "95": {
            "timeStamp": "2021-02-06T23:45:00",
            "mg/dL": 246.6,
            "nutrientNote": "",
            "nutrientValue": "",
            "exerciseNote": "",
            "exerciseValue": ""
          }
        },
        "exerciseEntries": {
          "0": {"type": "", "intensity": "", "timeStamp": ""}
        },
        "nutrientEntries": {
          "0": {"nutrientNote": "", "nutrientSize": "", "nutrientTimeStamp": ""}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));


}
