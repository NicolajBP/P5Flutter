import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p5/myEntries.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import "package:p5/graph.dart";


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => 
    _HomePageSate();
  
}
//sign user out 
void signUserOut(){
  FirebaseAuth.instance.signOut();
}

class _HomePageSate extends State<HomePage> {
DateTime _selectedDate = DateTime.now();
final user =FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //title: const Text("Logged in as " + user.email!),
      actions: const [
        IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.logout),
        ),
      ],
    ),
      
      
      body: Column(
        children: [
           ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return myEntries();
                }),
              );
            },
            child: const Text("MyEntries"),
           ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DatePicker(                                //kalenderbar
                DateTime.now().subtract(const Duration(days:2)), //vælger hvor mange dage vi kigger tilbage
                height: 80,
                width: 70,
                initialSelectedDate: DateTime.now(),
                selectionColor: Theme.of(context).colorScheme.primary,
                selectedTextColor: Theme.of(context).colorScheme.onPrimary,
                dateTextStyle: const TextStyle( //vi kan ogåså ændre på skriften af de andre
                  fontSize: 16,
                  fontWeight:FontWeight.w500,
                  color: Colors.grey
                 ),
                 onDateChange: (date) {
                    _selectedDate = date;  //variabel der kender hvilken dag det er
                 },
                      ),
            ),  
      Container(
              height: 250,
              width: double.infinity,
              child: LiveChartWidget(),
            ),
    
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              // Bruges som "router" --> vi føres fra denne side til en anden side (i det her tilfælde vores ReportNutrientIntakePage)
              return const ReportNutrientIntakePage();
            }));
          }, 
          style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0))),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.restaurant, size: 70.0,),
                Text("Register nutrient intake"),
              ],)
            ),
    
  
      const SizedBox(width: 30),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              // Bruges som "router" --> vi føres fra denne side til en anden side (i det her tilfælde vores ReportNutrientIntakePage)
              return const ReportExercise();
            }));
          },
          style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0))),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                 Icon(Icons.directions_run_outlined, size: 70.0,),
                  Text('Register exercise',
                  style: TextStyle(height: 1, fontSize: 14)),
        ],)
        )
    ],)
    ],)
      );
  }
}

// ef3320a880efa9714fbb239e3d60a7007d0bbe20