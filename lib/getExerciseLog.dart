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

import 'package:p5/exerciseLog.dart';

class GetExerciseLog extends StatelessWidget {
  final String documentId;
  final String dateId;

  // ignore: use_key_in_widget_constructors
  const GetExerciseLog(this.documentId, this.dateId);

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

          List<dynamic> exerciseTimeStamps = []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter
          List<dynamic> exerciseNotes = [];
          List<dynamic> exercisedurations = [];

          int? kMax = data['exerciseEntries']!.length;
          // int jMax = 1;


          for (var j = 1; j < kMax!; j++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            String exerciseNoteToAdd = "${data['exerciseEntries'][j]['exerciseNote']}";// Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime exerciseTimeStampToAdd = DateTime.parse("${data['exerciseEntries'][j]['exerciseTimeStamp']}");
            String exercisedurationToAdd = "${data['exerciseEntries'][j]['exerciseDuration']}";     
            exerciseNotes.add(exerciseNoteToAdd); // Tildeler exerciseNotes til arrayet / listen
            exerciseTimeStamps.add(exerciseTimeStampToAdd); // Vi tilføjer timestamps til arrayet
            exercisedurations.add(exercisedurationToAdd);

          }


          return SizedBox(
              height: 300, width: double.infinity, child: ExerciseLogWidget(exerciseTimeStamps, exerciseNotes, exercisedurations, kMax!));

        }

        return const Center(
          child: CircularProgressIndicator(), // Loadende cirkel hvis ikke der er data endnu
        );
      },
    );
  }
}