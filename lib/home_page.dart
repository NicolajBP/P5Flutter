import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)
import 'package:intl/intl.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});


@override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

var currentDate = DateFormat.yMMMd().format(DateTime.now());  
var today = DateTime.now();  
String finalDate = '';
bool isPressed1 = false;
var yesterday = '';


void resetButtonStates() {
  setState(() {
     isPressed1 = false;
  });
}

  @override
  Widget build(BuildContext context) {
 
 //var yesterday = today.subtract(const Duration(days: 1)); //.toString();
      getTheDayBefore(){
        var today = DateTime.now();
        yesterday = today.subtract(const Duration(days: 1)).toString();
        //var dateParse = DateTime.parse(yesterday);
        //var formattedDate = "${dateParse.day}/${dateParse.month}/${dateParse.year}";

        //setState(() {

          //  yesterday = today.toString();
            //finalDate = formattedDate.toString() ;

       // });
      }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {  
                      getTheDayBefore();
                      yesterday = today.toString();
                      debugPrint(yesterday);
                    }, 
                    icon: const Icon(Icons.arrow_back),
                    ),


  const SizedBox(width: 10),
            isPressed1 ? Text(yesterday) : Text(yesterday),


   const SizedBox(width: 10),

              IconButton(onPressed: (){

              }, 
              icon: const Icon(Icons.arrow_forward)),
              ]), 
            ),

   // const SizedBox(height: 10),
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
      )
    );
  }
}