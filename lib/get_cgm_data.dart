import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/graph.dart';
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
          List<dynamic> cgmData = []; // Man skal åbenbart gøre sådan her for at lave et array i Flutter

          for (var i = 0; i < 1; i++) { // Det er åbenbart sådan her man skal lave for-loops i Flutter
            // cgmData[i] = data['cgmData']["$i"];
            num data2add = num.parse("${data['cgmData']["$i"]["mg/dL"]}"); // Konverterer String fra JSON til num da vi skal bruge det til grafen
            DateTime time2add = DateTime.parse("${data['cgmData']["$i"]["timeStamp"]}");
            cgmData.add(data2add); // Tildeler num-værdien fra ovenstående linje til arrayet / listen
          }

          return Container(
              height: 250, width: double.infinity, child: LiveChartWidget(cgmData));
          // return Text("Full Name: ${data['cgmData']}");
          // return LiveChartWidget();
        }

        return Text("loading");
      },
    );
  }
}
