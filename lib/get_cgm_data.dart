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

          debugPrint("${data['cgmData']["0"]}");
          List<dynamic> cgmData = [];

          for (var i = 0; i < 20; i++) { // Den siger null når der er mere end i < 2
            // cgmData[i] = data['cgmData']["$i"];
            num data2add = num.parse("${data['cgmData']["$i"]}");
            cgmData.add(data2add);
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
