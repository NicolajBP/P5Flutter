import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});


@override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DatePicker(
                DateTime.now().subtract(const Duration(days:2)),
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
       //Text(initialSelectedDate.toString())   
      Container(
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              padding: const EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              child: const Text("Her kommer der en graf"),
            ),
      const SizedBox(height: 150),
    
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
                Icon(Icons.directions_run_outlined, size: 70.0,),
                Text('Register exercise',
                style: TextStyle(height: 1, fontSize: 14)),
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
            Icon(Icons.restaurant, size: 70.0,),
            Text("Register nutrient intake"),
        ],)
        )
    ],)
    ],)
      );
  }
}