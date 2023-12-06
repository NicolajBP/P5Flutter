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

class LiveChartWidget extends StatefulWidget {
  final List<dynamic> cgmValues;
  final List<dynamic> cgmTimeStamps;
  final List<dynamic> cgmNutrientIntakes;
  final List<dynamic> cgmNutrientValues;
  final List<dynamic> exerciseNotes;
  final List<dynamic> exerciseValues;

  // ignore: use_key_in_widget_constructors
  const LiveChartWidget(this.cgmValues, this.cgmTimeStamps, this.cgmNutrientIntakes,
      this.cgmNutrientValues, this.exerciseNotes, this.exerciseValues);

  @override
  // ignore: no_logic_in_create_state
  State<LiveChartWidget> createState() => _LiveChartWidgetState(
      cgmValues,
      cgmTimeStamps,
      cgmNutrientIntakes,
      cgmNutrientValues,
      exerciseNotes,
      exerciseValues);
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  late ZoomPanBehavior _zoomPanBehavior;
  final List<dynamic> cgmValues; // Vi laver en masse lister / arrays for at gemme vores værdier fra databasen så de kan indsættes i grafen
  final List<dynamic> cgmTimeStamps;
  final List<dynamic> cgmNutrientIntakes;
  final List<dynamic> cgmNutrientValues;
  final List<dynamic> exerciseNotes;
  final List<dynamic> exerciseValues;

  _LiveChartWidgetState( // Constructor (?)
      this.cgmValues,
      this.cgmTimeStamps,
      this.cgmNutrientIntakes,
      this.cgmNutrientValues,
      this.exerciseNotes,
      this.exerciseValues);
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior( // Noget med zoom som Seb har lavet?
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.grey);
    chartData = getChartData();

    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<LiveData> getChartData() { // Function der returnerer dataen til grafen
    List<LiveData> mapLiveData = [];

    for (var i = 0; i < 96; i++) { // Vi indlæser alt data til grafen i en for loop
      // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapLiveData.add(
        LiveData(
          time: cgmTimeStamps[i],
          bloodSugarLevel: cgmValues[i],
          nutrientIntakeValue: cgmNutrientValues[i],
          exerciseValue: exerciseValues[i],
        ),
      );
      if (cgmNutrientValues[i] != null) {
      debugPrint(cgmNutrientValues[i].toString());
      debugPrint(cgmTimeStamps[i].toString());
      }
      
    }
    debugPrint("Length is:");
    debugPrint(cgmNutrientValues.length.toString());

    return mapLiveData;
  }

/*  int time =30;
updateDataSource(Timer timer){
  chartData.add(LiveData(time++, (math.Random().nextInt(60)+30)));
  chartData.remove(0);
  _chartSeriesController.updateDataSource(
    addedDataIndex: chartData.length-1, removedDataIndex: 0
  );

}
 */

// Det Her er widget der bygger grafen op
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        SfCartesianChart(
          zoomPanBehavior: _zoomPanBehavior,
          title: ChartTitle(text: 'CGM-data'),
          legend: const Legend(isVisible: false),
          series: <ChartSeries>[
            LineSeries<LiveData, DateTime>( // Her plottes linjen på grafen
              dataSource: chartData,
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.bloodSugarLevel,
            ),
            ScatterSeries<LiveData, DateTime>( // Her plottes nutrient intake ikonerne
            dataSource: chartData,
            xValueMapper: (LiveData data, _) => data.time,
            yValueMapper: (LiveData data, _) => data.nutrientIntakeValue,
            markerSettings: const MarkerSettings(
                shape: DataMarkerType.image,
                height: 10,
                width: 10,
                image: AssetImage('images/INTAKE.png'))),
            ScatterSeries<LiveData, DateTime>( // Her plottes exercise ikonerne
            dataSource: chartData,
            xValueMapper: (LiveData data, _) => data.time,
            yValueMapper: (LiveData data, _) => data.exerciseValue,
            markerSettings: const MarkerSettings(
                shape: DataMarkerType.image,
                height: 12,
                width: 12,
                image: AssetImage('images/EXERCISE.png')))
          ],
          primaryXAxis: DateTimeAxis(
              intervalType: DateTimeIntervalType.auto,
              interval: 1,
              plotBands: <PlotBand>[
            //grøn bånd
            PlotBand( // Er det her den grønne boks på grafen??
              isVisible: true,
              start: cgmTimeStamps[
                  0], //x-aksen start - går nok galt når vi ændrer dagen
              end: cgmTimeStamps[95],
              associatedAxisStart: 120, //y-aksen start
              associatedAxisEnd: 200,
              shouldRenderAboveSeries: false,
              color: const Color.fromARGB(5, 197, 239, 197), //farve
              opacity: 0.5, //gennemsigtighed (0-1)
            ),
              ]),
          primaryYAxis:
              NumericAxis(/* minimum: 70, maximum: 400, */ 
              title: AxisTitle(
                text: 'Blood glucose [mg/dL]',
                textStyle: const TextStyle(fontSize: 10),
                alignment: ChartAlignment.center),
               
            plotBands: <PlotBand>[
            PlotBand(
              //LOW stiplet linje
              isVisible: true,
              start: 100,
              end: 100,
              borderWidth: 2,
              borderColor: Colors.red,
              dashArray: const <double>[4, 5],
              text: 'LOW',
              textStyle: const TextStyle(color: Colors.red),
              horizontalTextAlignment: TextAnchor.end,
            ),
            PlotBand(
              //HIGH stiplet linje
              isVisible: true,
              start: 220,
              end: 220,
              borderWidth: 2,
              borderColor: Colors.red,
              dashArray: const <double>[4, 5],
              text: 'HIGH',
              textStyle: const TextStyle(color: Colors.red),
              horizontalTextAlignment: TextAnchor.end,
            )
          ]),
        ),
      ],
    )));
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
}

class LiveData { // Her defineres klassen LiveData
  final DateTime? time;
  final num? bloodSugarLevel;
  final num? nutrientIntakeValue;
  final String? nutrientIntakeNote;
  final num? exerciseValue;
  final String? exerciseNote;

  List<dynamic>? mappedData;

  LiveData(
      {this.time,
      this.bloodSugarLevel,
      this.mappedData,
      this.nutrientIntakeValue,
      this.nutrientIntakeNote,
      this.exerciseNote,
      this.exerciseValue});
}
