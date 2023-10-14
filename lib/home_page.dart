import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)

class HomePage extends StatelessWidget {
   HomePage({super.key});
//sign user out 
void signUserOut(){
  FirebaseAuth.instance.signOut();
}
final user =FirebaseAuth.instance.currentUser!;

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Logged in as " + user.email!),
      actions: [
        IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.logout),
        ),
      ],
    ),
    body: Column(
      children: [
        Container(
          color: Colors.lightBlue,
          margin: const EdgeInsets.fromLTRB(100, 20, 100, 20),
          padding: const EdgeInsets.all(50),
          height: 250,
          width: double.infinity,
          child: const Text("Her kommer der en graf"),
        ),
        const SizedBox(height: 5),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const ReportNutrientIntakePage();
                }),
              );
            },
            child: const Text("Report nutrient intake"),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const ReportExercise();
                }),
              );
            },
            child: const Text("Report exercise"),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const TestPage();
                }),
              );
            },
            child: const Text("Test Page"),
          ),
        ),
      ],
    ),
  );
}
}