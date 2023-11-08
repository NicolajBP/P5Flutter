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

import 'package:p5/bar_chart.dart';

class FetchStatsPage extends StatelessWidget {
  final String documentId;
  final String dateId;

  // ignore: use_key_in_widget_constructors
  const FetchStatsPage(this.documentId, this.dateId);

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
          List<dynamic> cgmTimeStamps =
              []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter
          List<dynamic> cgmValues = [];

          for (var i = 0; i < 96; i++) {
            // Det er åbenbart sådan her man skal lave for-loops i Flutter
            num data2add = num.parse(
                "${data['cgmData']["$i"]["mg/dL"]}"); // Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime time2add =
                DateTime.parse("${data['cgmData']["$i"]["timeStamp"]}");

            cgmValues.add(
                data2add); // Tildeler num-værdien (blodsukkerniveau)fra ovenstående linje til arrayet / listen
            cgmTimeStamps.add(time2add); // Vi tilføjer timestamps til arrayet
          }

          return Container(
              height: 600, width: double.infinity, child:  BarChartWidget(cgmValues, cgmTimeStamps));

        }

        return Container(
          color: Colors.blue,
          margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          padding: const EdgeInsets.all(20),
          height: 300,
          width: double.infinity,
          child: const Text("Her kommer der en trend"),
        )
        ;
      },
    );
  }
}
