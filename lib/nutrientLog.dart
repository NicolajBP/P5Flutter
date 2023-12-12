// ignore: unused_import
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

class NutrientLogWidget extends StatefulWidget {
  final List<dynamic> nutrientTimeStamps;
  final List<dynamic> nutrientNotes;
  final List<dynamic> nutrientSizes;
  final int amountOfEntries;

  // ignore: use_key_in_widget_constructors
  const NutrientLogWidget(this.nutrientTimeStamps, this.nutrientNotes,
      this.nutrientSizes, this.amountOfEntries);

  @override
  // ignore: no_logic_in_create_state
  State<NutrientLogWidget> createState() => _NutrientLogWidgetState(
      nutrientTimeStamps, nutrientNotes, nutrientSizes, amountOfEntries);
}

class _NutrientLogWidgetState extends State<NutrientLogWidget> {
  late List<NutrientEntry> nutrientData;
  final List<dynamic> nutrientTimeStamps;
  final List<dynamic> nutrientNotes;
  final List<dynamic> nutrientSizes;
  final int amountOfEntries;

  _NutrientLogWidgetState(
      // Constructor (?)
      this.nutrientTimeStamps,
      this.nutrientNotes,
      this.nutrientSizes,
      this.amountOfEntries);
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    List<NutrientEntry> nutrientData = getNutrientEntries();
    super.initState();

    setState(() {
      nutrientData = getNutrientEntries();
    });

    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<NutrientEntry> getNutrientEntries() {
    // Function der returnerer dataen til grafen
    List<NutrientEntry> mapNutrientEntries = [];

    for (var i = 0; i < amountOfEntries - 1; i++) {
      // Vi indlæser alt data til grafen i en for loop
      // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapNutrientEntries.add(
        NutrientEntry(
          nutrientTimeStamp: nutrientTimeStamps[i],
          nutrientNote: nutrientNotes[i],
          nutrientSize: nutrientSizes[i],
        ),
      );
    }
    return mapNutrientEntries;
  }

// Det Her er widget der bygger grafen op
  @override
  Widget build(BuildContext context) {
    setState(() {
      nutrientData = getNutrientEntries();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous nutrient entries"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: amountOfEntries -1,
        itemBuilder: (BuildContext context, int index) {
          
          // For each entry, assign text variables to display 
          String timeText = nutrientData[index].nutrientTimeStamp.toString();
          String noteText = nutrientData[index].nutrientNote;
          String sizeText = nutrientData[index].nutrientSize;

          // Create a list of Card widgets containing information about each nutrient entry
          return Card(
              child: ListTile(
            title: Text(noteText),
            subtitle: Text('Size: $sizeText, Time: $timeText'),
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

class NutrientEntry {
  // Her defineres klassen LiveData
  final DateTime nutrientTimeStamp;
  final String nutrientNote;
  final String nutrientSize;

  NutrientEntry({
    required this.nutrientTimeStamp,
    required this.nutrientNote,
    required this.nutrientSize,
  });
}
