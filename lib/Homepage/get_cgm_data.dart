import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p5/Homepage/graph.dart';
import 'dart:convert';

class GetCgmData extends StatelessWidget {
  final String documentId;
  final String dateId;

  GetCgmData(this.documentId, this.dateId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).collection("patientData").doc(dateId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          debugPrint("${data['cgmData']["0"]["mg/dL"]}");
          debugPrint("${data['cgmData']["0"]["timeStamp"]}");
          debugPrint("${data['cgmData']["0"]["nutrientIntake"]}");
          debugPrint("${data['cgmData']["0"]["nutrientValue"]}");
          List<dynamic> cgmTimeStamps = []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter
          List<dynamic> cgmValues = []; 
          List<dynamic> cgmNutrientNotes = [];
          List<dynamic> cgmNutrientValues = [];
          List<dynamic> cgmExerciseNotes = [];
          List<dynamic> cgmExerciseValues = [];

          for (var i = 0; i < 96; i++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            num data2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}"); // Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime time2add = DateTime.parse("${data['cgmData']["$i"]["timeStamp"]}");
            String food2add = "${data['cgmData']["$i"]["nutrientIntake"]}";   // Konverterer String fra JSON til num da vi skal bruge det til grafen
            
            cgmValues.add(data2add); // Tildeler num-værdien (blodsukkerniveau)fra ovenstående linje til arrayet / listen
            cgmTimeStamps.add(time2add); // Vi tilføjer timestamps til arrayet
            cgmNutrientNotes.add(food2add); // Vi tilføjer mad til arrayet


            if (("${data['cgmData']["$i"]["nutrientValue"]}").isEmpty) {
            num? foodValue2add = null;
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
            } else {
              num foodValue2add = num.parse("${data['cgmData']["$i"]["nutrientValue"]}");
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
            }

            if (("${data['cgmData']["$i"]["exerciseValue"]}").isEmpty) {
            num? exerciseValue2add = null;
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer mad til arrayet
            } else {
              num exerciseValue2add = num.parse("${data['cgmData']["$i"]["exerciseValue"]}");
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer mad til arrayet
            }

          }
        

          return Container(
              height: 250, width: double.infinity, child: LiveChartWidget(cgmValues, cgmTimeStamps, cgmNutrientNotes, cgmNutrientValues,cgmExerciseNotes, cgmExerciseValues));
          // return Text("Full Name: ${data['cgmData']}");
          // return LiveChartWidget();
        }

        return Center(
          child: CircularProgressIndicator(), // Loadende cirkel hvis ikke der er data endnu
        );
      },
    );
  }
}