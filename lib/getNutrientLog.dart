// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:p5/Homepage/graph.dart';
// ignore: unused_import
import 'dart:convert';

import 'package:p5/nutrientLog.dart';

class GetNutrientLog extends StatelessWidget {
  final String documentId;
  final String dateId;

  // ignore: use_key_in_widget_constructors
  const GetNutrientLog(this.documentId, this.dateId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).collection("patientData").doc(dateId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          debugPrint("${data['cgmData']["0"]["mg/dL"]}");
          debugPrint("${data['cgmData']["0"]["timeStamp"]}");
          debugPrint("${data['cgmData']["0"]["nutrientIntake"]}");
          debugPrint("${data['cgmData']["0"]["nutrientValue"]}");
          List<dynamic> nutrientTimeStamps = []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter
          List<dynamic> nutrientNotes = [];
          List<dynamic> nutrientSizes = [];

          int? jMax = data['nutrientEntries']!.length;
          // int jMax = 1;


          for (var j = 1; j < jMax!; j++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            String nutrientNoteToAdd = "${data['nutrientEntries'][j]['nutrientNote']}";// Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime nutrientTimeStampToAdd = DateTime.parse("${data['nutrientEntries'][j]['nutrientTimeStamp']}");
            String nutrientSizeToAdd = "${data['nutrientEntries'][j]['nutrientSize']}";     
            nutrientNotes.add(nutrientNoteToAdd); // Tildeler nutrientNotes til arrayet / listen
            nutrientTimeStamps.add(nutrientTimeStampToAdd); // Vi tilføjer timestamps til arrayet
            nutrientSizes.add(nutrientSizeToAdd);

          }


          return SizedBox(
              height: 300, width: double.infinity, child: NutrientLogWidget(nutrientTimeStamps, nutrientNotes, nutrientSizes, jMax!));

        }

        return const Center(
          child: CircularProgressIndicator(), // Loadende cirkel hvis ikke der er data endnu
        );
      },
    );
  }
}