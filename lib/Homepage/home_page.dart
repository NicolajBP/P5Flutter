// ignore_for_file: unused_import

// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Homepage/get_cgm_data.dart';
import 'package:p5/Homepage/graph.dart';
import 'package:p5/Login/register_page.dart';
import 'package:p5/myEntriesPage.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/uploadCgmData.dart';

bool isLoading = false;   //create a variable to define wheather loading or not

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageSate();
}

//sign user out
void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _HomePageSate extends State<HomePage> {

    void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        isLoading = true; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }
  // DateTime _selectedDate = DateTime.now(); // Starter med i dag som standard
  DateTime _selectedDate = DateTime(2023, 11,
      8); // Starter på 8. november som standard (data er importeret for 1., 2. og 3. november)

  final user = FirebaseAuth.instance.currentUser!;
  final dateUpdater =
      ValueNotifier<String>(DateTime.now().toString().substring(0, 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Inspect your blood glucose")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DatePicker(
                  //kalenderbar
                  DateTime.now().subtract(const Duration(
                      days: 4)), //vælger hvor mange dage vi kigger tilbage
                  height: 80,
                  width: 70,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Theme.of(context).colorScheme.primary,
                  selectedTextColor: Theme.of(context).colorScheme.onPrimary,
                  dateTextStyle: const TextStyle(
                      //vi kan ogåså ændre på skriften af de andre
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  onDateChange: (date) {
                    _selectedDate =
                        date; //variabel der kender hvilken dag det er
                    dateUpdater.value =
                        _selectedDate.toString().substring(0, 10);
                    // dateYYYY_MM_DD = _selectedDate.toString().substring(0,10); // Bruges til at indlæse "YYYY-MM-DD" (document ID) fra databasen
                    // debugPrint("Selected day: $dateYYYY_MM_DD");
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: dateUpdater,
                builder: (context, value, widget) {
                  return GetCgmData(user.uid, dateUpdater.value);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      //nutrient intake button
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          // Bruges som "router" --> vi føres fra denne side til en anden side (i det her tilfælde vores ReportNutrientIntakePage)
                          return const ReportNutrientIntakePage();
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.transparent),
                          elevation: 7,
                          shadowColor: const Color.fromARGB(255, 209, 198, 191),
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 80,
                            child: Icon(
                              Icons.restaurant,
                              size: 60.0,
                            ),
                          ),
                          Text(
                            "Register \nnutrient intake",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  const SizedBox(width: 30),
                  OutlinedButton(
                    //exercise button
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        // Bruges som "router" --> vi føres fra denne side til en anden side (i det her tilfælde vores ReportNutrientIntakePage)
                        return const ReportExercise();
                      }));
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.transparent),
                        elevation: 7,
                        shadowColor: const Color.fromARGB(255, 209, 198, 191),
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 110,
                            height: 80,
                            child: Icon(
                              Icons.directions_run_outlined,
                              size: 60.0,
                            )),
                        Text(
                          'Register \nexercise',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 240,
                height: 60,
                child: OutlinedButton(
                  //exercise button
                  onPressed: () {
                    // if(isLoading){
                    //   CircularProgressIndicator();
                    // }
                    startTimer();
                    uploadCgmData(context);
                    Future.delayed(const Duration(seconds: 2)).then((_){
                      ScaffoldMessenger.of(context).showSnackBar(
                      
                      const SnackBar(

                        content: Text('CGM-data added successfully.'),
                        
                        duration:
                            Duration(seconds: 2), // Ændre længden af display
                      ),

                    );});
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                      elevation: 7,
                      shadowColor: const Color.fromARGB(255, 209, 198, 191),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 60.0,
                      ),
                      Text(
                        'Add CGM data',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
