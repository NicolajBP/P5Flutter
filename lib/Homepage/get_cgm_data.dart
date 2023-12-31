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
          List<dynamic> timeSlots = [];
          bool nutrientValueAdded = false;
          bool exerciseValueAdded = false;


          DateTime lastMidnight = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 00);
          DateTime newTime = lastMidnight;
          DateTime testTime = lastMidnight;

          for (var k = 0; k < 96; k++) {
            timeSlots.add(testTime);
            testTime = testTime.add(const Duration(minutes: 15));
          }


          int j = 0;
          int h = 0;
          int? nutrientEntriesLength = data['nutrientEntries']!.length;
          int? exerciseEntriesLength = data['exerciseEntries']!.length;

          for (var i = 0; i < 96; i++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            num data2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}"); // Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime time2add = DateTime.parse("${data['cgmData']["$i"]["timeStamp"]}");        
            cgmValues.add(data2add); // Tildeler num-værdien (blodsukkerniveau)fra ovenstående linje til arrayet / listen
            cgmTimeStamps.add(time2add); // Vi tilføjer timestamps til arrayet




            debugPrint(newTime.toString());

            
            if (nutrientEntriesLength! > 0){
            for (j=0; j<nutrientEntriesLength!; j++) {
            DateTime? nutrientTime2add = DateTime.parse("${data['nutrientEntries'][j]["nutrientTimeStamp"]}");
              if (nutrientTime2add.isAtSameMomentAs(timeSlots[i])) {
                String nutrientNoteToAdd = "${data['nutrientEntries'][j]['nutrientNote']}";
                cgmNutrientNotes.add(nutrientNoteToAdd);

                num? foodValue2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}");
                cgmNutrientValues.add(foodValue2add);
                nutrientValueAdded = true;

              } 
            }
            }

            if (exerciseEntriesLength! > 0){
            for (h=0; h<exerciseEntriesLength!; h++) {
            
            DateTime? exerciseTime2add = DateTime.parse("${data['exerciseEntries'][h]["exerciseTimeStamp"]}");
              if (exerciseTime2add.isAtSameMomentAs(timeSlots[i])) {
                String exerciseNoteToAdd = "${data['exerciseEntries'][h]['exerciseNote']}";
                cgmExerciseNotes.add(exerciseNoteToAdd);

                num? exerciseValue2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}");
                cgmExerciseValues.add(exerciseValue2add);
                exerciseValueAdded = true;
              } 
            }
            }


            if (("${data['cgmData']["$i"]["nutrientValue"]}").isEmpty && nutrientValueAdded == false)  {
            num? foodValue2add;
            String? nutrientNoteToAdd;
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
              cgmNutrientNotes.add(nutrientNoteToAdd);
            } else if(
              ("${data['cgmData']["$i"]["nutrientValue"]}").isEmpty && nutrientValueAdded == true) {

            }
            else {
              num foodValue2add = num.parse("${data['cgmData']["$i"]["nutrientValue"]}");
              cgmNutrientValues.add(foodValue2add); // Vi tilføjer mad til arrayet
              String nutrientNoteToAdd = "${data['cgmData']["$i"]['nutrientNote']}";
              cgmNutrientNotes.add(nutrientNoteToAdd);
            }


          

            if (("${data['cgmData']["$i"]["exerciseValue"]}").isEmpty && exerciseValueAdded == false) {
            num? exerciseValue2add;
            String? exerciseNoteToAdd;
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer mad til arrayet
              cgmExerciseNotes.add(exerciseNoteToAdd);
            } else if(
              ("${data['cgmData']["$i"]["exerciseValue"]}").isEmpty && exerciseValueAdded == true) {

            } 
            else {
              num exerciseValue2add = num.parse("${data['cgmData']["$i"]["exerciseValue"]}");
              cgmExerciseValues.add(exerciseValue2add); // Vi tilføjer exercise til arrayet
              String exerciseNoteToAdd = "${data['cgmData']["$i"]['exerciseNote']}";
              cgmExerciseNotes.add(exerciseNoteToAdd);
            }


            debugPrint(newTime.toString());
            nutrientValueAdded = false;
            exerciseValueAdded = false;

          }


          return SizedBox(
              height: 300, width: double.infinity, child: LiveChartWidget(cgmValues, cgmTimeStamps, cgmNutrientNotes, cgmNutrientValues,cgmExerciseNotes, cgmExerciseValues, nutrientEntriesLength!));

        }

        return const Center(
          child: CircularProgressIndicator(), // Loadende cirkel hvis ikke der er data endnu
        );
      },
    );
  }
}