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
    "timeStamp": "2021-02-10T00:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "1": {
    "timeStamp": "2021-02-10T00:15:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "2": {
    "timeStamp": "2021-02-10T00:30:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "3": {
    "timeStamp": "2021-02-10T00:45:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "4": {
    "timeStamp": "2021-02-10T01:00:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "5": {
    "timeStamp": "2021-02-10T01:15:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "6": {
    "timeStamp": "2021-02-10T01:30:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "7": {
    "timeStamp": "2021-02-10T01:45:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "8": {
    "timeStamp": "2021-02-10T02:00:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "9": {
    "timeStamp": "2021-02-10T02:15:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "10": {
    "timeStamp": "2021-02-10T02:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "11": {
    "timeStamp": "2021-02-10T02:45:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "12": {
    "timeStamp": "2021-02-10T03:00:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "13": {
    "timeStamp": "2021-02-10T03:15:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "14": {
    "timeStamp": "2021-02-10T03:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "15": {
    "timeStamp": "2021-02-10T03:45:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "16": {
    "timeStamp": "2021-02-10T04:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "17": {
    "timeStamp": "2021-02-10T04:15:00",
    "mg/dL": 171,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "18": {
    "timeStamp": "2021-02-10T04:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "19": {
    "timeStamp": "2021-02-10T04:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "20": {
    "timeStamp": "2021-02-10T05:00:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "21": {
    "timeStamp": "2021-02-10T05:15:00",
    "mg/dL": 163.8,
    "nutrientNote": "Coarse grain 100 g\nBraised mutton 50 g\nBroad bean 50 g\nShrimp 30 g",
    "nutrientValue": 163.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "22": {
    "timeStamp": "2021-02-10T05:30:00",
    "mg/dL": 162,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "23": {
    "timeStamp": "2021-02-10T05:45:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "24": {
    "timeStamp": "2021-02-10T06:00:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "25": {
    "timeStamp": "2021-02-10T06:15:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "26": {
    "timeStamp": "2021-02-10T06:30:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "27": {
    "timeStamp": "2021-02-10T06:45:00",
    "mg/dL": 178.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "28": {
    "timeStamp": "2021-02-10T07:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "29": {
    "timeStamp": "2021-02-10T07:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "30": {
    "timeStamp": "2021-02-10T07:30:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "31": {
    "timeStamp": "2021-02-10T07:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "32": {
    "timeStamp": "2021-02-10T08:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Walk",
    "exerciseValue": 165.6
  },
  "33": {
    "timeStamp": "2021-02-10T08:15:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "34": {
    "timeStamp": "2021-02-10T08:30:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "35": {
    "timeStamp": "2021-02-10T08:45:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "36": {
    "timeStamp": "2021-02-10T09:00:00",
    "mg/dL": 225,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "37": {
    "timeStamp": "2021-02-10T09:15:00",
    "mg/dL": 264.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "38": {
    "timeStamp": "2021-02-10T09:30:00",
    "mg/dL": 291.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "39": {
    "timeStamp": "2021-02-10T09:45:00",
    "mg/dL": 309.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "40": {
    "timeStamp": "2021-02-10T10:00:00",
    "mg/dL": 313.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "41": {
    "timeStamp": "2021-02-10T10:15:00",
    "mg/dL": 309.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "42": {
    "timeStamp": "2021-02-10T10:30:00",
    "mg/dL": 289.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "43": {
    "timeStamp": "2021-02-10T10:45:00",
    "mg/dL": 270,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "44": {
    "timeStamp": "2021-02-10T11:00:00",
    "mg/dL": 271.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "45": {
    "timeStamp": "2021-02-10T11:15:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "46": {
    "timeStamp": "2021-02-10T11:30:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "47": {
    "timeStamp": "2021-02-10T11:45:00",
    "mg/dL": 219.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "48": {
    "timeStamp": "2021-02-10T12:00:00",
    "mg/dL": 198,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "49": {
    "timeStamp": "2021-02-10T12:15:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "50": {
    "timeStamp": "2021-02-10T12:30:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "51": {
    "timeStamp": "2021-02-10T12:45:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "52": {
    "timeStamp": "2021-02-10T13:00:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "53": {
    "timeStamp": "2021-02-10T13:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "54": {
    "timeStamp": "2021-02-10T13:30:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "55": {
    "timeStamp": "2021-02-10T13:45:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "56": {
    "timeStamp": "2021-02-10T14:00:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "57": {
    "timeStamp": "2021-02-10T14:15:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "58": {
    "timeStamp": "2021-02-10T14:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "59": {
    "timeStamp": "2021-02-10T14:45:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "60": {
    "timeStamp": "2021-02-10T15:00:00",
    "mg/dL": 129.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Swim",
    "exerciseValue": 129.6
  },
  "61": {
    "timeStamp": "2021-02-10T15:15:00",
    "mg/dL": 127.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "62": {
    "timeStamp": "2021-02-10T15:30:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "63": {
    "timeStamp": "2021-02-10T15:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "64": {
    "timeStamp": "2021-02-10T16:00:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "65": {
    "timeStamp": "2021-02-10T16:15:00",
    "mg/dL": 234,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "66": {
    "timeStamp": "2021-02-10T16:30:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "67": {
    "timeStamp": "2021-02-10T16:45:00",
    "mg/dL": 280.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "68": {
    "timeStamp": "2021-02-10T17:00:00",
    "mg/dL": 289.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "69": {
    "timeStamp": "2021-02-10T17:15:00",
    "mg/dL": 291.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "70": {
    "timeStamp": "2021-02-10T17:30:00",
    "mg/dL": 307.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "71": {
    "timeStamp": "2021-02-10T17:45:00",
    "mg/dL": 322.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "72": {
    "timeStamp": "2021-02-10T18:00:00",
    "mg/dL": 316.8,
    "nutrientNote": "Stuffed sticky rice ball 100 g\nDeep-fried dough stick 50 g",
    "nutrientValue": 316.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "73": {
    "timeStamp": "2021-02-10T18:15:00",
    "mg/dL": 288,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "74": {
    "timeStamp": "2021-02-10T18:30:00",
    "mg/dL": 259.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "75": {
    "timeStamp": "2021-02-10T18:45:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "76": {
    "timeStamp": "2021-02-10T19:00:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "77": {
    "timeStamp": "2021-02-10T19:15:00",
    "mg/dL": 212.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "78": {
    "timeStamp": "2021-02-10T19:30:00",
    "mg/dL": 216,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "79": {
    "timeStamp": "2021-02-10T19:45:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "80": {
    "timeStamp": "2021-02-10T20:00:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "81": {
    "timeStamp": "2021-02-10T20:15:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "82": {
    "timeStamp": "2021-02-10T20:30:00",
    "mg/dL": 241.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "83": {
    "timeStamp": "2021-02-10T20:45:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "84": {
    "timeStamp": "2021-02-10T21:00:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "85": {
    "timeStamp": "2021-02-10T21:15:00",
    "mg/dL": 217.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "86": {
    "timeStamp": "2021-02-10T21:30:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "87": {
    "timeStamp": "2021-02-10T21:45:00",
    "mg/dL": 226.8,
    "nutrientNote": "Coarse grain 137 g\nSmoked fish 52 g\nBraised mutton 58 g",
    "nutrientValue": 226.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "88": {
    "timeStamp": "2021-02-10T22:00:00",
    "mg/dL": 226.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "89": {
    "timeStamp": "2021-02-10T22:15:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "90": {
    "timeStamp": "2021-02-10T22:30:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "91": {
    "timeStamp": "2021-02-10T22:45:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "92": {
    "timeStamp": "2021-02-10T23:00:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "93": {
    "timeStamp": "2021-02-10T23:15:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "94": {
    "timeStamp": "2021-02-10T23:30:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "95": {
    "timeStamp": "2021-02-10T23:45:00",
    "mg/dL": 239.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  }
},
                "exerciseEntries": {
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "nutrientNote": "Smoked fish 50 g\nSword bean 50 g\nRed wine 60 g\nPan fried bun 80 g",
    "nutrientValue": 145.8,
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "exerciseNote": "Run",
    "exerciseValue": 255.6
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "Steamed bun 120 g\nMilk cereal 100 g",
    "nutrientValue": 187.2,
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "Chicken leg 50 g\nVegetable 55 g\nBean sprout 25 g\nRice 100 g",
    "nutrientValue": 169.2,
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
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "nutrientNote": "Egg 50 g",
    "nutrientValue": 174.6,
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
    "nutrientNote": "Coarse grain 87 g\nVegetable 52 g\nSnakehead 50 g",
    "nutrientValue": 154.8,
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
    "exerciseNote": "Swim",
    "exerciseValue": 136.8
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
    "nutrientNote": "Croissants 80 g\nMilk cereal 150 g",
    "nutrientValue": 156.6,
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "Steamed yellow croaker 50 g\nVegetable 56 g\nTofu 20 g\nBullfrog 100 g\nSteamed sponge cake 40 g",
    "nutrientValue": 241.2,
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
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "nutrientNote": "Rice cake 100 g\nVegetable 50 g",
    "nutrientValue": 156.6,
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
    "exerciseNote": "Walk",
    "exerciseValue": 151.2
  },
  "31": {
    "timeStamp": "2021-02-06T07:45:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "exerciseNote": "",
    "exerciseValue": ""
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
    "nutrientNote": "Croissants 80 g\nMilk cereal with notoginseng powder 150 g",
    "nutrientValue": 196.2,
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
    "exerciseNote": "Run",
    "exerciseValue": 192.6
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
    "nutrientNote": "",
    "nutrientValue": "",
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
    "nutrientNote": "Rice 100 g\nChicken nugget 50 g\nPotato 58 g",
    "nutrientValue": 199.8,
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
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "timeStamp": "2021-02-07T00:00:00",
    "mg/dL": 226.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "1": {
    "timeStamp": "2021-02-07T00:15:00",
    "mg/dL": 214.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "2": {
    "timeStamp": "2021-02-07T00:30:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "3": {
    "timeStamp": "2021-02-07T00:45:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "4": {
    "timeStamp": "2021-02-07T01:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "5": {
    "timeStamp": "2021-02-07T01:15:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "6": {
    "timeStamp": "2021-02-07T01:30:00",
    "mg/dL": 178.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "7": {
    "timeStamp": "2021-02-07T01:45:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "8": {
    "timeStamp": "2021-02-07T02:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "9": {
    "timeStamp": "2021-02-07T02:15:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "10": {
    "timeStamp": "2021-02-07T02:30:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "11": {
    "timeStamp": "2021-02-07T02:45:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "12": {
    "timeStamp": "2021-02-07T03:00:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "13": {
    "timeStamp": "2021-02-07T03:15:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "14": {
    "timeStamp": "2021-02-07T03:30:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "15": {
    "timeStamp": "2021-02-07T03:45:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "16": {
    "timeStamp": "2021-02-07T04:00:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "17": {
    "timeStamp": "2021-02-07T04:15:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "18": {
    "timeStamp": "2021-02-07T04:30:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "19": {
    "timeStamp": "2021-02-07T04:45:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "20": {
    "timeStamp": "2021-02-07T05:00:00",
    "mg/dL": 142.2,
    "nutrientNote": "Coarse grain 50 g\nScrambled egg with tomato 50 g\nBraised fish 50 g\nGreen vegetable 30 g",
    "nutrientValue": 142.2,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "21": {
    "timeStamp": "2021-02-07T05:15:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "22": {
    "timeStamp": "2021-02-07T05:30:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "23": {
    "timeStamp": "2021-02-07T05:45:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "24": {
    "timeStamp": "2021-02-07T06:00:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "25": {
    "timeStamp": "2021-02-07T06:15:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "26": {
    "timeStamp": "2021-02-07T06:30:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "27": {
    "timeStamp": "2021-02-07T06:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "28": {
    "timeStamp": "2021-02-07T07:00:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "29": {
    "timeStamp": "2021-02-07T07:15:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "30": {
    "timeStamp": "2021-02-07T07:30:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "31": {
    "timeStamp": "2021-02-07T07:45:00",
    "mg/dL": 158.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "32": {
    "timeStamp": "2021-02-07T08:00:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "33": {
    "timeStamp": "2021-02-07T08:15:00",
    "mg/dL": 219.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "34": {
    "timeStamp": "2021-02-07T08:30:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "35": {
    "timeStamp": "2021-02-07T08:45:00",
    "mg/dL": 239.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "36": {
    "timeStamp": "2021-02-07T09:00:00",
    "mg/dL": 248.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "37": {
    "timeStamp": "2021-02-07T09:15:00",
    "mg/dL": 246.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "38": {
    "timeStamp": "2021-02-07T09:30:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "39": {
    "timeStamp": "2021-02-07T09:45:00",
    "mg/dL": 210.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "40": {
    "timeStamp": "2021-02-07T10:00:00",
    "mg/dL": 201.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "41": {
    "timeStamp": "2021-02-07T10:15:00",
    "mg/dL": 196.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "42": {
    "timeStamp": "2021-02-07T10:30:00",
    "mg/dL": 183.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "43": {
    "timeStamp": "2021-02-07T10:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "44": {
    "timeStamp": "2021-02-07T11:00:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "45": {
    "timeStamp": "2021-02-07T11:15:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Swim",
    "exerciseValue": 135
  },
  "46": {
    "timeStamp": "2021-02-07T11:30:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "47": {
    "timeStamp": "2021-02-07T11:45:00",
    "mg/dL": 129.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "48": {
    "timeStamp": "2021-02-07T12:00:00",
    "mg/dL": 124.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "49": {
    "timeStamp": "2021-02-07T12:15:00",
    "mg/dL": 126,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "50": {
    "timeStamp": "2021-02-07T12:30:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "51": {
    "timeStamp": "2021-02-07T12:45:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "52": {
    "timeStamp": "2021-02-07T13:00:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "53": {
    "timeStamp": "2021-02-07T13:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "54": {
    "timeStamp": "2021-02-07T13:30:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "55": {
    "timeStamp": "2021-02-07T13:45:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "56": {
    "timeStamp": "2021-02-07T14:00:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "57": {
    "timeStamp": "2021-02-07T14:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "58": {
    "timeStamp": "2021-02-07T14:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "59": {
    "timeStamp": "2021-02-07T14:45:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "60": {
    "timeStamp": "2021-02-07T15:00:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "61": {
    "timeStamp": "2021-02-07T15:15:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "62": {
    "timeStamp": "2021-02-07T15:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "63": {
    "timeStamp": "2021-02-07T15:45:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "64": {
    "timeStamp": "2021-02-07T16:00:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "65": {
    "timeStamp": "2021-02-07T16:15:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "66": {
    "timeStamp": "2021-02-07T16:30:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "67": {
    "timeStamp": "2021-02-07T16:45:00",
    "mg/dL": 199.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "68": {
    "timeStamp": "2021-02-07T17:00:00",
    "mg/dL": 226.8,
    "nutrientNote": "Steamed bun 100 g\nMilk cereal with notoginseng powder 100 g",
    "nutrientValue": 226.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "69": {
    "timeStamp": "2021-02-07T17:15:00",
    "mg/dL": 246.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "70": {
    "timeStamp": "2021-02-07T17:30:00",
    "mg/dL": 253.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "71": {
    "timeStamp": "2021-02-07T17:45:00",
    "mg/dL": 246.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "72": {
    "timeStamp": "2021-02-07T18:00:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "73": {
    "timeStamp": "2021-02-07T18:15:00",
    "mg/dL": 244.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "74": {
    "timeStamp": "2021-02-07T18:30:00",
    "mg/dL": 270,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "75": {
    "timeStamp": "2021-02-07T18:45:00",
    "mg/dL": 286.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "76": {
    "timeStamp": "2021-02-07T19:00:00",
    "mg/dL": 297,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "77": {
    "timeStamp": "2021-02-07T19:15:00",
    "mg/dL": 300.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "78": {
    "timeStamp": "2021-02-07T19:30:00",
    "mg/dL": 282.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "79": {
    "timeStamp": "2021-02-07T19:45:00",
    "mg/dL": 271.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "80": {
    "timeStamp": "2021-02-07T20:00:00",
    "mg/dL": 264.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "81": {
    "timeStamp": "2021-02-07T20:15:00",
    "mg/dL": 244.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "82": {
    "timeStamp": "2021-02-07T20:30:00",
    "mg/dL": 239.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "83": {
    "timeStamp": "2021-02-07T20:45:00",
    "mg/dL": 243,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "84": {
    "timeStamp": "2021-02-07T21:00:00",
    "mg/dL": 225,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "85": {
    "timeStamp": "2021-02-07T21:15:00",
    "mg/dL": 208.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "86": {
    "timeStamp": "2021-02-07T21:30:00",
    "mg/dL": 192.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "87": {
    "timeStamp": "2021-02-07T21:45:00",
    "mg/dL": 176.4,
    "nutrientNote": "Rice 50 g\nFried egg  80 g\nPotato 50 g",
    "nutrientValue": 176.4,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "88": {
    "timeStamp": "2021-02-07T22:00:00",
    "mg/dL": 158.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "89": {
    "timeStamp": "2021-02-07T22:15:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "90": {
    "timeStamp": "2021-02-07T22:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "91": {
    "timeStamp": "2021-02-07T22:45:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "92": {
    "timeStamp": "2021-02-07T23:00:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "93": {
    "timeStamp": "2021-02-07T23:15:00",
    "mg/dL": 162,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "94": {
    "timeStamp": "2021-02-07T23:30:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "95": {
    "timeStamp": "2021-02-07T23:45:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  }
},
         "exerciseEntries": {
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "timeStamp": "2021-02-08T00:00:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "1": {
    "timeStamp": "2021-02-08T00:15:00",
    "mg/dL": 129.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "2": {
    "timeStamp": "2021-02-08T00:30:00",
    "mg/dL": 131.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "3": {
    "timeStamp": "2021-02-08T00:45:00",
    "mg/dL": 122.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "4": {
    "timeStamp": "2021-02-08T01:00:00",
    "mg/dL": 124.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "5": {
    "timeStamp": "2021-02-08T01:15:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "6": {
    "timeStamp": "2021-02-08T01:30:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "7": {
    "timeStamp": "2021-02-08T01:45:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "8": {
    "timeStamp": "2021-02-08T02:00:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "9": {
    "timeStamp": "2021-02-08T02:15:00",
    "mg/dL": 136.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "10": {
    "timeStamp": "2021-02-08T02:30:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "11": {
    "timeStamp": "2021-02-08T02:45:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "12": {
    "timeStamp": "2021-02-08T03:00:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "13": {
    "timeStamp": "2021-02-08T03:15:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "14": {
    "timeStamp": "2021-02-08T03:30:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "15": {
    "timeStamp": "2021-02-08T03:45:00",
    "mg/dL": 142.2,
    "nutrientNote": "Corn 100 g\nFried egg  10 g\nPotato 50 g",
    "nutrientValue": 142.2,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "16": {
    "timeStamp": "2021-02-08T04:00:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "17": {
    "timeStamp": "2021-02-08T04:15:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "18": {
    "timeStamp": "2021-02-08T04:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "19": {
    "timeStamp": "2021-02-08T04:45:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "20": {
    "timeStamp": "2021-02-08T05:00:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "21": {
    "timeStamp": "2021-02-08T05:15:00",
    "mg/dL": 136.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "22": {
    "timeStamp": "2021-02-08T05:30:00",
    "mg/dL": 136.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "23": {
    "timeStamp": "2021-02-08T05:45:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "24": {
    "timeStamp": "2021-02-08T06:00:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "25": {
    "timeStamp": "2021-02-08T06:15:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "26": {
    "timeStamp": "2021-02-08T06:30:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "27": {
    "timeStamp": "2021-02-08T06:45:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "28": {
    "timeStamp": "2021-02-08T07:00:00",
    "mg/dL": 147.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "29": {
    "timeStamp": "2021-02-08T07:15:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "30": {
    "timeStamp": "2021-02-08T07:30:00",
    "mg/dL": 142.2,
    "nutrientNote": "Egg 50 g",
    "nutrientValue": 142.2,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "31": {
    "timeStamp": "2021-02-08T07:45:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "32": {
    "timeStamp": "2021-02-08T08:00:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "33": {
    "timeStamp": "2021-02-08T08:15:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "34": {
    "timeStamp": "2021-02-08T08:30:00",
    "mg/dL": 248.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "35": {
    "timeStamp": "2021-02-08T08:45:00",
    "mg/dL": 250.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "36": {
    "timeStamp": "2021-02-08T09:00:00",
    "mg/dL": 252,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "37": {
    "timeStamp": "2021-02-08T09:15:00",
    "mg/dL": 250.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "38": {
    "timeStamp": "2021-02-08T09:30:00",
    "mg/dL": 246.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "39": {
    "timeStamp": "2021-02-08T09:45:00",
    "mg/dL": 235.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "40": {
    "timeStamp": "2021-02-08T10:00:00",
    "mg/dL": 212.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "41": {
    "timeStamp": "2021-02-08T10:15:00",
    "mg/dL": 185.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "42": {
    "timeStamp": "2021-02-08T10:30:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "43": {
    "timeStamp": "2021-02-08T10:45:00",
    "mg/dL": 136.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "44": {
    "timeStamp": "2021-02-08T11:00:00",
    "mg/dL": 129.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Run",
    "exerciseValue": 129.6
  },
  "45": {
    "timeStamp": "2021-02-08T11:15:00",
    "mg/dL": 118.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "46": {
    "timeStamp": "2021-02-08T11:30:00",
    "mg/dL": 106.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "47": {
    "timeStamp": "2021-02-08T11:45:00",
    "mg/dL": 108,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "48": {
    "timeStamp": "2021-02-08T12:00:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "49": {
    "timeStamp": "2021-02-08T12:15:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "50": {
    "timeStamp": "2021-02-08T12:30:00",
    "mg/dL": 196.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "51": {
    "timeStamp": "2021-02-08T12:45:00",
    "mg/dL": 207,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "52": {
    "timeStamp": "2021-02-08T13:00:00",
    "mg/dL": 217.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "53": {
    "timeStamp": "2021-02-08T13:15:00",
    "mg/dL": 219.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "54": {
    "timeStamp": "2021-02-08T13:30:00",
    "mg/dL": 210.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "55": {
    "timeStamp": "2021-02-08T13:45:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "56": {
    "timeStamp": "2021-02-08T14:00:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "57": {
    "timeStamp": "2021-02-08T14:15:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "58": {
    "timeStamp": "2021-02-08T14:30:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "59": {
    "timeStamp": "2021-02-08T14:45:00",
    "mg/dL": 192.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "60": {
    "timeStamp": "2021-02-08T15:00:00",
    "mg/dL": 196.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "61": {
    "timeStamp": "2021-02-08T15:15:00",
    "mg/dL": 194.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "62": {
    "timeStamp": "2021-02-08T15:30:00",
    "mg/dL": 208.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "63": {
    "timeStamp": "2021-02-08T15:45:00",
    "mg/dL": 241.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "64": {
    "timeStamp": "2021-02-08T16:00:00",
    "mg/dL": 253.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "65": {
    "timeStamp": "2021-02-08T16:15:00",
    "mg/dL": 252,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "66": {
    "timeStamp": "2021-02-08T16:30:00",
    "mg/dL": 255.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "67": {
    "timeStamp": "2021-02-08T16:45:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "68": {
    "timeStamp": "2021-02-08T17:00:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "69": {
    "timeStamp": "2021-02-08T17:15:00",
    "mg/dL": 264.6,
    "nutrientNote": "Steamed corn bun 100 g\nStewed white fungus and  Chinese forest frog 100 g",
    "nutrientValue": 264.6,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "70": {
    "timeStamp": "2021-02-08T17:30:00",
    "mg/dL": 268.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "71": {
    "timeStamp": "2021-02-08T17:45:00",
    "mg/dL": 259.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "72": {
    "timeStamp": "2021-02-08T18:00:00",
    "mg/dL": 243,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "73": {
    "timeStamp": "2021-02-08T18:15:00",
    "mg/dL": 225,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "74": {
    "timeStamp": "2021-02-08T18:30:00",
    "mg/dL": 214.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "75": {
    "timeStamp": "2021-02-08T18:45:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "76": {
    "timeStamp": "2021-02-08T19:00:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "77": {
    "timeStamp": "2021-02-08T19:15:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "78": {
    "timeStamp": "2021-02-08T19:30:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "79": {
    "timeStamp": "2021-02-08T19:45:00",
    "mg/dL": 196.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "80": {
    "timeStamp": "2021-02-08T20:00:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "81": {
    "timeStamp": "2021-02-08T20:15:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "82": {
    "timeStamp": "2021-02-08T20:30:00",
    "mg/dL": 122.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "83": {
    "timeStamp": "2021-02-08T20:45:00",
    "mg/dL": 118.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "84": {
    "timeStamp": "2021-02-08T21:00:00",
    "mg/dL": 120.6,
    "nutrientNote": "Dried sliced bean curd 50 g\nRadish 30 g\nVegetable 30 g\nDeep-fried chicken fillet 50 g\nRice 100 g",
    "nutrientValue": 120.6,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "85": {
    "timeStamp": "2021-02-08T21:15:00",
    "mg/dL": 126,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "86": {
    "timeStamp": "2021-02-08T21:30:00",
    "mg/dL": 131.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "87": {
    "timeStamp": "2021-02-08T21:45:00",
    "mg/dL": 131.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "88": {
    "timeStamp": "2021-02-08T22:00:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "89": {
    "timeStamp": "2021-02-08T22:15:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "90": {
    "timeStamp": "2021-02-08T22:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "91": {
    "timeStamp": "2021-02-08T22:45:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "92": {
    "timeStamp": "2021-02-08T23:00:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "93": {
    "timeStamp": "2021-02-08T23:15:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "94": {
    "timeStamp": "2021-02-08T23:30:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "95": {
    "timeStamp": "2021-02-08T23:45:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  }
},
        "exerciseEntries": {
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "timeStamp": "2021-02-09T00:00:00",
    "mg/dL": 183.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "1": {
    "timeStamp": "2021-02-09T00:15:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "2": {
    "timeStamp": "2021-02-09T00:30:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "3": {
    "timeStamp": "2021-02-09T00:45:00",
    "mg/dL": 185.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "4": {
    "timeStamp": "2021-02-09T01:00:00",
    "mg/dL": 185.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "5": {
    "timeStamp": "2021-02-09T01:15:00",
    "mg/dL": 185.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "6": {
    "timeStamp": "2021-02-09T01:30:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "7": {
    "timeStamp": "2021-02-09T01:45:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "8": {
    "timeStamp": "2021-02-09T02:00:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "9": {
    "timeStamp": "2021-02-09T02:15:00",
    "mg/dL": 183.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "10": {
    "timeStamp": "2021-02-09T02:30:00",
    "mg/dL": 178.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "11": {
    "timeStamp": "2021-02-09T02:45:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "12": {
    "timeStamp": "2021-02-09T03:00:00",
    "mg/dL": 178.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "13": {
    "timeStamp": "2021-02-09T03:15:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "14": {
    "timeStamp": "2021-02-09T03:30:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "15": {
    "timeStamp": "2021-02-09T03:45:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "16": {
    "timeStamp": "2021-02-09T04:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "17": {
    "timeStamp": "2021-02-09T04:15:00",
    "mg/dL": 160.2,
    "nutrientNote": "Coarse grain 65 g\nScrambled egg with tomato 10 g\nBraised fish 50 g\nBroad bean 20 g\nShrimp 20 g",
    "nutrientValue": 160.2,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "18": {
    "timeStamp": "2021-02-09T04:30:00",
    "mg/dL": 156.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "19": {
    "timeStamp": "2021-02-09T04:45:00",
    "mg/dL": 153,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "20": {
    "timeStamp": "2021-02-09T05:00:00",
    "mg/dL": 153,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "21": {
    "timeStamp": "2021-02-09T05:15:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "22": {
    "timeStamp": "2021-02-09T05:30:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "23": {
    "timeStamp": "2021-02-09T05:45:00",
    "mg/dL": 154.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "24": {
    "timeStamp": "2021-02-09T06:00:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "25": {
    "timeStamp": "2021-02-09T06:15:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "26": {
    "timeStamp": "2021-02-09T06:30:00",
    "mg/dL": 156.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "27": {
    "timeStamp": "2021-02-09T06:45:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "28": {
    "timeStamp": "2021-02-09T07:00:00",
    "mg/dL": 153,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "29": {
    "timeStamp": "2021-02-09T07:15:00",
    "mg/dL": 142.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "30": {
    "timeStamp": "2021-02-09T07:30:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "31": {
    "timeStamp": "2021-02-09T07:45:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Walk",
    "exerciseValue": 140.4
  },
  "32": {
    "timeStamp": "2021-02-09T08:00:00",
    "mg/dL": 153,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "33": {
    "timeStamp": "2021-02-09T08:15:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "34": {
    "timeStamp": "2021-02-09T08:30:00",
    "mg/dL": 219.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "35": {
    "timeStamp": "2021-02-09T08:45:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "36": {
    "timeStamp": "2021-02-09T09:00:00",
    "mg/dL": 250.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "37": {
    "timeStamp": "2021-02-09T09:15:00",
    "mg/dL": 253.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "38": {
    "timeStamp": "2021-02-09T09:30:00",
    "mg/dL": 252,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "39": {
    "timeStamp": "2021-02-09T09:45:00",
    "mg/dL": 246.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "40": {
    "timeStamp": "2021-02-09T10:00:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "41": {
    "timeStamp": "2021-02-09T10:15:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "42": {
    "timeStamp": "2021-02-09T10:30:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "43": {
    "timeStamp": "2021-02-09T10:45:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "44": {
    "timeStamp": "2021-02-09T11:00:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "45": {
    "timeStamp": "2021-02-09T11:15:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "46": {
    "timeStamp": "2021-02-09T11:30:00",
    "mg/dL": 115.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "47": {
    "timeStamp": "2021-02-09T11:45:00",
    "mg/dL": 108,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "48": {
    "timeStamp": "2021-02-09T12:00:00",
    "mg/dL": 111.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "49": {
    "timeStamp": "2021-02-09T12:15:00",
    "mg/dL": 124.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "50": {
    "timeStamp": "2021-02-09T12:30:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "51": {
    "timeStamp": "2021-02-09T12:45:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "52": {
    "timeStamp": "2021-02-09T13:00:00",
    "mg/dL": 171,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "53": {
    "timeStamp": "2021-02-09T13:15:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "54": {
    "timeStamp": "2021-02-09T13:30:00",
    "mg/dL": 198,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "55": {
    "timeStamp": "2021-02-09T13:45:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "56": {
    "timeStamp": "2021-02-09T14:00:00",
    "mg/dL": 194.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "57": {
    "timeStamp": "2021-02-09T14:15:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "58": {
    "timeStamp": "2021-02-09T14:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "59": {
    "timeStamp": "2021-02-09T14:45:00",
    "mg/dL": 140.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "60": {
    "timeStamp": "2021-02-09T15:00:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "61": {
    "timeStamp": "2021-02-09T15:15:00",
    "mg/dL": 127.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "62": {
    "timeStamp": "2021-02-09T15:30:00",
    "mg/dL": 122.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "63": {
    "timeStamp": "2021-02-09T15:45:00",
    "mg/dL": 126,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "64": {
    "timeStamp": "2021-02-09T16:00:00",
    "mg/dL": 133.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "65": {
    "timeStamp": "2021-02-09T16:15:00",
    "mg/dL": 144,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "66": {
    "timeStamp": "2021-02-09T16:30:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "67": {
    "timeStamp": "2021-02-09T16:45:00",
    "mg/dL": 127.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "68": {
    "timeStamp": "2021-02-09T17:00:00",
    "mg/dL": 135,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "69": {
    "timeStamp": "2021-02-09T17:15:00",
    "mg/dL": 153,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "70": {
    "timeStamp": "2021-02-09T17:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "Steamed bun 80 g\nStewed white fungus and  Chinese forest frog 100 g",
    "nutrientValue": 165.6,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "71": {
    "timeStamp": "2021-02-09T17:45:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "72": {
    "timeStamp": "2021-02-09T18:00:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "73": {
    "timeStamp": "2021-02-09T18:15:00",
    "mg/dL": 210.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "74": {
    "timeStamp": "2021-02-09T18:30:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "75": {
    "timeStamp": "2021-02-09T18:45:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "76": {
    "timeStamp": "2021-02-09T19:00:00",
    "mg/dL": 214.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "77": {
    "timeStamp": "2021-02-09T19:15:00",
    "mg/dL": 205.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "78": {
    "timeStamp": "2021-02-09T19:30:00",
    "mg/dL": 194.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "79": {
    "timeStamp": "2021-02-09T19:45:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "80": {
    "timeStamp": "2021-02-09T20:00:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "81": {
    "timeStamp": "2021-02-09T20:15:00",
    "mg/dL": 194.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "82": {
    "timeStamp": "2021-02-09T20:30:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "83": {
    "timeStamp": "2021-02-09T20:45:00",
    "mg/dL": 261,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "84": {
    "timeStamp": "2021-02-09T21:00:00",
    "mg/dL": 264.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "85": {
    "timeStamp": "2021-02-09T21:15:00",
    "mg/dL": 248.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "86": {
    "timeStamp": "2021-02-09T21:30:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "87": {
    "timeStamp": "2021-02-09T21:45:00",
    "mg/dL": 214.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "88": {
    "timeStamp": "2021-02-09T22:00:00",
    "mg/dL": 207,
    "nutrientNote": "Bombay duck 50 g\nBraised mutton 56 g\nScrambled egg with leek sprout  32 g\nShrimp 30 g\nBullfrog 35 g\nPan fried bun 50 g",
    "nutrientValue": 207,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "89": {
    "timeStamp": "2021-02-09T22:15:00",
    "mg/dL": 205.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "90": {
    "timeStamp": "2021-02-09T22:30:00",
    "mg/dL": 196.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "91": {
    "timeStamp": "2021-02-09T22:45:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "92": {
    "timeStamp": "2021-02-09T23:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "93": {
    "timeStamp": "2021-02-09T23:15:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "94": {
    "timeStamp": "2021-02-09T23:30:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "95": {
    "timeStamp": "2021-02-09T23:45:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  }
},
        "exerciseEntries": {
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
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
    "timeStamp": "2021-02-10T00:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "1": {
    "timeStamp": "2021-02-10T00:15:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "2": {
    "timeStamp": "2021-02-10T00:30:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "3": {
    "timeStamp": "2021-02-10T00:45:00",
    "mg/dL": 176.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "4": {
    "timeStamp": "2021-02-10T01:00:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "5": {
    "timeStamp": "2021-02-10T01:15:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "6": {
    "timeStamp": "2021-02-10T01:30:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "7": {
    "timeStamp": "2021-02-10T01:45:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "8": {
    "timeStamp": "2021-02-10T02:00:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "9": {
    "timeStamp": "2021-02-10T02:15:00",
    "mg/dL": 169.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "10": {
    "timeStamp": "2021-02-10T02:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "11": {
    "timeStamp": "2021-02-10T02:45:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "12": {
    "timeStamp": "2021-02-10T03:00:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "13": {
    "timeStamp": "2021-02-10T03:15:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "14": {
    "timeStamp": "2021-02-10T03:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "15": {
    "timeStamp": "2021-02-10T03:45:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "16": {
    "timeStamp": "2021-02-10T04:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "17": {
    "timeStamp": "2021-02-10T04:15:00",
    "mg/dL": 171,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "18": {
    "timeStamp": "2021-02-10T04:30:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "19": {
    "timeStamp": "2021-02-10T04:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "20": {
    "timeStamp": "2021-02-10T05:00:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "21": {
    "timeStamp": "2021-02-10T05:15:00",
    "mg/dL": 163.8,
    "nutrientNote": "Coarse grain 100 g\nBraised mutton 50 g\nBroad bean 50 g\nShrimp 30 g",
    "nutrientValue": 163.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "22": {
    "timeStamp": "2021-02-10T05:30:00",
    "mg/dL": 162,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "23": {
    "timeStamp": "2021-02-10T05:45:00",
    "mg/dL": 160.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "24": {
    "timeStamp": "2021-02-10T06:00:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "25": {
    "timeStamp": "2021-02-10T06:15:00",
    "mg/dL": 174.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "26": {
    "timeStamp": "2021-02-10T06:30:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "27": {
    "timeStamp": "2021-02-10T06:45:00",
    "mg/dL": 178.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "28": {
    "timeStamp": "2021-02-10T07:00:00",
    "mg/dL": 172.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "29": {
    "timeStamp": "2021-02-10T07:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "30": {
    "timeStamp": "2021-02-10T07:30:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "31": {
    "timeStamp": "2021-02-10T07:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "32": {
    "timeStamp": "2021-02-10T08:00:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Walk",
    "exerciseValue": 165.6
  },
  "33": {
    "timeStamp": "2021-02-10T08:15:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "34": {
    "timeStamp": "2021-02-10T08:30:00",
    "mg/dL": 163.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "35": {
    "timeStamp": "2021-02-10T08:45:00",
    "mg/dL": 181.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "36": {
    "timeStamp": "2021-02-10T09:00:00",
    "mg/dL": 225,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "37": {
    "timeStamp": "2021-02-10T09:15:00",
    "mg/dL": 264.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "38": {
    "timeStamp": "2021-02-10T09:30:00",
    "mg/dL": 291.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "39": {
    "timeStamp": "2021-02-10T09:45:00",
    "mg/dL": 309.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "40": {
    "timeStamp": "2021-02-10T10:00:00",
    "mg/dL": 313.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "41": {
    "timeStamp": "2021-02-10T10:15:00",
    "mg/dL": 309.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "42": {
    "timeStamp": "2021-02-10T10:30:00",
    "mg/dL": 289.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "43": {
    "timeStamp": "2021-02-10T10:45:00",
    "mg/dL": 270,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "44": {
    "timeStamp": "2021-02-10T11:00:00",
    "mg/dL": 271.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "45": {
    "timeStamp": "2021-02-10T11:15:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "46": {
    "timeStamp": "2021-02-10T11:30:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "47": {
    "timeStamp": "2021-02-10T11:45:00",
    "mg/dL": 219.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "48": {
    "timeStamp": "2021-02-10T12:00:00",
    "mg/dL": 198,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "49": {
    "timeStamp": "2021-02-10T12:15:00",
    "mg/dL": 187.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "50": {
    "timeStamp": "2021-02-10T12:30:00",
    "mg/dL": 190.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "51": {
    "timeStamp": "2021-02-10T12:45:00",
    "mg/dL": 189,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "52": {
    "timeStamp": "2021-02-10T13:00:00",
    "mg/dL": 180,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "53": {
    "timeStamp": "2021-02-10T13:15:00",
    "mg/dL": 167.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "54": {
    "timeStamp": "2021-02-10T13:30:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "55": {
    "timeStamp": "2021-02-10T13:45:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "56": {
    "timeStamp": "2021-02-10T14:00:00",
    "mg/dL": 151.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "57": {
    "timeStamp": "2021-02-10T14:15:00",
    "mg/dL": 149.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "58": {
    "timeStamp": "2021-02-10T14:30:00",
    "mg/dL": 145.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "59": {
    "timeStamp": "2021-02-10T14:45:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "60": {
    "timeStamp": "2021-02-10T15:00:00",
    "mg/dL": 129.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "Swim",
    "exerciseValue": 129.6
  },
  "61": {
    "timeStamp": "2021-02-10T15:15:00",
    "mg/dL": 127.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "62": {
    "timeStamp": "2021-02-10T15:30:00",
    "mg/dL": 138.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "63": {
    "timeStamp": "2021-02-10T15:45:00",
    "mg/dL": 165.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "64": {
    "timeStamp": "2021-02-10T16:00:00",
    "mg/dL": 203.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "65": {
    "timeStamp": "2021-02-10T16:15:00",
    "mg/dL": 234,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "66": {
    "timeStamp": "2021-02-10T16:30:00",
    "mg/dL": 257.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "67": {
    "timeStamp": "2021-02-10T16:45:00",
    "mg/dL": 280.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "68": {
    "timeStamp": "2021-02-10T17:00:00",
    "mg/dL": 289.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "69": {
    "timeStamp": "2021-02-10T17:15:00",
    "mg/dL": 291.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "70": {
    "timeStamp": "2021-02-10T17:30:00",
    "mg/dL": 307.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "71": {
    "timeStamp": "2021-02-10T17:45:00",
    "mg/dL": 322.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "72": {
    "timeStamp": "2021-02-10T18:00:00",
    "mg/dL": 316.8,
    "nutrientNote": "Stuffed sticky rice ball 100 g\nDeep-fried dough stick 50 g",
    "nutrientValue": 316.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "73": {
    "timeStamp": "2021-02-10T18:15:00",
    "mg/dL": 288,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "74": {
    "timeStamp": "2021-02-10T18:30:00",
    "mg/dL": 259.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "75": {
    "timeStamp": "2021-02-10T18:45:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "76": {
    "timeStamp": "2021-02-10T19:00:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "77": {
    "timeStamp": "2021-02-10T19:15:00",
    "mg/dL": 212.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "78": {
    "timeStamp": "2021-02-10T19:30:00",
    "mg/dL": 216,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "79": {
    "timeStamp": "2021-02-10T19:45:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "80": {
    "timeStamp": "2021-02-10T20:00:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "81": {
    "timeStamp": "2021-02-10T20:15:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "82": {
    "timeStamp": "2021-02-10T20:30:00",
    "mg/dL": 241.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "83": {
    "timeStamp": "2021-02-10T20:45:00",
    "mg/dL": 237.6,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "84": {
    "timeStamp": "2021-02-10T21:00:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "85": {
    "timeStamp": "2021-02-10T21:15:00",
    "mg/dL": 217.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "86": {
    "timeStamp": "2021-02-10T21:30:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "87": {
    "timeStamp": "2021-02-10T21:45:00",
    "mg/dL": 226.8,
    "nutrientNote": "Coarse grain 137 g\nSmoked fish 52 g\nBraised mutton 58 g",
    "nutrientValue": 226.8,
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "88": {
    "timeStamp": "2021-02-10T22:00:00",
    "mg/dL": 226.8,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "89": {
    "timeStamp": "2021-02-10T22:15:00",
    "mg/dL": 221.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "90": {
    "timeStamp": "2021-02-10T22:30:00",
    "mg/dL": 223.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "91": {
    "timeStamp": "2021-02-10T22:45:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "92": {
    "timeStamp": "2021-02-10T23:00:00",
    "mg/dL": 232.2,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "93": {
    "timeStamp": "2021-02-10T23:15:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "94": {
    "timeStamp": "2021-02-10T23:30:00",
    "mg/dL": 230.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  },
  "95": {
    "timeStamp": "2021-02-10T23:45:00",
    "mg/dL": 239.4,
    "nutrientNote": "",
    "nutrientValue": "",
    "exerciseNote": "",
    "exerciseValue": ""
  }
},
        "exerciseEntries": {
        {"exerciseSize": "placeholder", "exerciseNote": "placeholder", "exerciseDuration": "placeholder", "exerciseTimeStamp": "1970-01-01T00:00:00"}
        },
        "nutrientEntries": {
        {"nutrientNote": "placeholder", "nutrientSize": "placeholder", "nutrientTimeStamp": "1970-01-01T00:00:00"}
        },
      })
      // ignore: avoid_print
      .then((_) => print("Added"))
      // ignore: avoid_print
      .catchError((error) => print("Add failed: $error"));


}
