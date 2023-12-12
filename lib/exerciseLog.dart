// ignore: unused_importExerciseLogWidget
import 'dart:io';

// ignore: unused_import
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:p5/Login/register_page.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';

class ExerciseLogWidget extends StatefulWidget {
  final List<dynamic> exerciseTimeStamps;
  final List<dynamic> exerciseNotes;
  final List<dynamic> exerciseSizes;
  final int amountOfEntries;

  // ignore: use_key_in_widget_constructors
  const ExerciseLogWidget(this.exerciseTimeStamps, this.exerciseNotes,
      this.exerciseSizes, this.amountOfEntries);

  @override
  // ignore: no_logic_in_create_state
  State<ExerciseLogWidget> createState() => _ExerciseLogWidgetState(
      exerciseTimeStamps, exerciseNotes, exerciseSizes, amountOfEntries);
}

class _ExerciseLogWidgetState extends State<ExerciseLogWidget> {
  late List<exerciseEntry> exerciseData;
  final List<dynamic> exerciseTimeStamps;
  final List<dynamic> exerciseNotes;
  final List<dynamic> exerciseSizes;
  final int amountOfEntries;

  _ExerciseLogWidgetState(
      // Constructor (?)
      this.exerciseTimeStamps,
      this.exerciseNotes,
      this.exerciseSizes,
      this.amountOfEntries);
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    List<exerciseEntry> exerciseData = getexerciseEntries();
    super.initState();

    setState(() {
      exerciseData = getexerciseEntries();
    });

    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<exerciseEntry> getexerciseEntries() {
    // Function der returnerer dataen til grafen
    List<exerciseEntry> mapexerciseEntries = [];

    for (var i = 0; i < amountOfEntries - 1; i++) {
      // Vi indlæser alt data til grafen i en for loop
      // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapexerciseEntries.add(
        exerciseEntry(
          exerciseTimeStamp: exerciseTimeStamps[i],
          exerciseNote: exerciseNotes[i],
          exerciseDuration: exerciseSizes[i],
        ),
      );
    }
    return mapexerciseEntries;
  }

// Det Her er widget der bygger grafen op
  @override
  Widget build(BuildContext context) {
    setState(() {
      exerciseData = getexerciseEntries();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous exercise entries"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: amountOfEntries - 1,
        itemBuilder: (BuildContext context, int index) {

          // For each entry, assign text variables to display
          String timeText = exerciseData[index].exerciseTimeStamp.toString();
          String noteText = exerciseData[index].exerciseNote;
          String durationText = exerciseData[index].exerciseDuration;

          // Create a list of Card widgets containing information about each nutrient entr
          return Card(
              child: ListTile(
            title: Text(noteText),
            subtitle: Text('Duration: $durationText, Time: $timeText'),
          ));
        },
      ),
    );
  }
}

/*   @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: SfCartesianChart(
        series: [
          LineSeries<LiveData,int>(
            onRendererCreated: (ChartSeriesController controller){
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            xValueMapper: (LiveData data,_)=> data.time,
            yValueMapper: (LiveData data,_)=> data.bloodSugarLevel,
          )
        ],
      ),

    ),
    );
  } */

class exerciseEntry {
  // Her defineres klassen LiveData
  final DateTime exerciseTimeStamp;
  final String exerciseNote;
  final String exerciseDuration;

  exerciseEntry({
    required this.exerciseTimeStamp,
    required this.exerciseNote,
    required this.exerciseDuration,
  });
}
