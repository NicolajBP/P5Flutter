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

class GetCgmData extends StatelessWidget {
  final String documentId;
  final String dateId;

  // ignore: use_key_in_widget_constructors
  const GetCgmData(this.documentId, this.dateId);

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
          List<dynamic> cgmTimeStamps = []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter
          List<dynamic> cgmValues = []; 
          List<dynamic> cgmNutrientNotes = [];
          List<dynamic> cgmNutrientValues = [];
          List<dynamic> cgmExerciseNotes = [];
          List<dynamic> cgmExerciseValues = [];
          // List<DateTime> timeSlots = [];

          DateTime lastMidnight = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 00);
          DateTime newTime = lastMidnight;
          // for (var i = 0; i < 96; i++) {
          //   timeSlots.add(newTime);
          //   newTime = newTime.add(Duration(minutes: 15));
            
          // }

          // DateTime? lastMidnight = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 00);
          // debugPrint(lastMidnight.toString());
          int j = 0;
          int jMax = data['nutrientEntries']!.length - 1;

          for (var i = 0; i < 96; i++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            num data2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}"); // Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime time2add = DateTime.parse("${data['cgmData']["$i"]["timeStamp"]}");

            String food2add = "${data['cgmData']["$i"]["nutrientIntake"]}";   // Konverterer String fra JSON til num da vi skal bruge det til grafen
            
            cgmValues.add(data2add); // Tildeler num-værdien (blodsukkerniveau)fra ovenstående linje til arrayet / listen
            cgmTimeStamps.add(time2add); // Vi tilføjer timestamps til arrayet
            cgmNutrientNotes.add(food2add); // Vi tilføjer mad til arrayet

            // DateTime? nutrientTime2add = DateTime.parse("${data['nutrientEntries'][j]["nutrientTimeStamp"]}");
            
            // debugPrint(nutrientTime2add.toString());
            // debugPrint(jMax.toString());
            // lastMidnight.add(Duration(minutes: 15));
            debugPrint(newTime.toString());
            // debugPrint(timeSlots[i].toString());
            
        
            for (j=0; j<jMax; j++) {
            DateTime? nutrientTime2add = DateTime.parse("${data['nutrientEntries'][j]["nutrientTimeStamp"]}");
            if (nutrientTime2add.isAtSameMomentAs(newTime)) {
              // cgmNutrientValues.add(num.parse("${data['cgmData']["$i"]["nutrientValue"]}"));
              num? foodValue2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}");
              cgmNutrientValues.add(foodValue2add);
              if (j < jMax){
              // j++;
              }
              // j++;
              // debugPrint("NutrientTimeToAdd:");
              // debugPrint(nutrientTime2add.toString());
              // debugPrint("NewTimeToAdd start:");
              // debugPrint(newTime.toString());
              // debugPrint("NewTimeToAdd stop:");
              // j++;
            } else {
              // j--;
            }
            }
            // timeSlots.add(newTime);
            newTime = newTime.add(Duration(minutes: 15));
            debugPrint(newTime.toString());
            

            if (("${data['cgmData']["$i"]["nutrientValue"]}").isEmpty) {
            num? foodValue2add;
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
            } else {
              num foodValue2add = num.parse("${data['cgmData']["$i"]["nutrientValue"]}");
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
            }


          

            if (("${data['cgmData']["$i"]["exerciseValue"]}").isEmpty) {
            num? exerciseValue2add;
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer mad til arrayet
            } else {
              num exerciseValue2add = num.parse("${data['cgmData']["$i"]["exerciseValue"]}");
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer mad til arrayet
            }

          }


          return SizedBox(
              height: 300, width: double.infinity, child: LiveChartWidget(cgmValues, cgmTimeStamps, cgmNutrientNotes, cgmNutrientValues,cgmExerciseNotes, cgmExerciseValues));
          // return Text("Full Name: ${data['cgmData']}");
          // return LiveChartWidget();
        }

        return const Center(
          child: CircularProgressIndicator(), // Loadende cirkel hvis ikke der er data endnu
        );
      },
    );
  }
}