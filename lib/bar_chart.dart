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
// ignore: unused_import
import 'package:excel/excel.dart';
// ignore: unused_import
import 'dart:io';
// ignore: depend_on_referenced_packages, unused_import
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChartWidget extends StatefulWidget {
  final List<dynamic> cgmValues;
  final List<dynamic> cgmTimeStamps;

  // ignore: use_key_in_widget_constructors
  const BarChartWidget(this.cgmValues, this.cgmTimeStamps);

  @override
  // ignore: no_logic_in_create_state
  State<BarChartWidget> createState() =>
      _BarChartWidgetState(cgmValues, cgmTimeStamps);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  late List<ChartSampleData> chartData;
  late List<ChartSampleData> chartDataBackground;
  late num average;
  late num min;
  late num max;
  var unit = 'mg/dL';
  late ZoomPanBehavior _zoomPanBehavior;
  final List<dynamic>
      cgmValues; // Vi laver en masse lister / arrays for at gemme vores værdier fra databasen så de kan indsættes i grafen
  final List<dynamic> cgmTimeStamps;

  _BarChartWidgetState(
    // Constructor (?)
    this.cgmValues,
    this.cgmTimeStamps,
  );

  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(
        // Noget med zoom som Seb har lavet?
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.grey);
    // chartData = fetchChartData();

    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<ChartSampleData> fetchChartData() {
    // Function der returnerer dataen til grafen
    // List<ChartSampleData > chartData = [];
    num low = 0;
    num inRange = 0;
    num high = 0;
    for (var i = 0; i < cgmValues.length; i++) {
      switch (cgmValues[i]) {
        case <= 140:
          low++;
          break;
        case > 140 && <= 200:
          inRange++;
          break;
        case > 200:
          high++;
          break;
      }
    }
    low = (low / cgmValues.length) * 100;
    inRange = (inRange / cgmValues.length) * 100;
    high = (high / cgmValues.length) * 100;

    chartData = <ChartSampleData>[
      ChartSampleData(
          time: "Below Range",
          bloodSugarLevel: low,
          color: Color.fromARGB(217, 194, 25, 13)),
      ChartSampleData(
          time: "In Range",
          bloodSugarLevel: inRange,
          color: Color.fromARGB(217, 80, 168, 9)),
      ChartSampleData(
          time: "Above Range",
          bloodSugarLevel: high,
          color: Color.fromARGB(217, 211, 161, 10)),
    ];

    chartDataBackground = <ChartSampleData>[
      ChartSampleData(
          time: "Below Range", bloodSugarLevel: 100, color: Colors.grey),
      ChartSampleData(
          time: "In Range", bloodSugarLevel: 100, color: Colors.grey),
      ChartSampleData(
          time: "Above Range", bloodSugarLevel: 100, color: Colors.grey),
    ];

    // return mapLiveData;
    return chartData;
  }

  // Udregner gennemsnit
  num fetchAverage() {
    num sum = 0;

    for (var i = 0; i < cgmValues.length; i++) {
      sum += cgmValues[i];
    }
    num average = sum / cgmValues.length;

    return average;
  }

  // Udregner minimum
  num fetchMininum() {
    cgmValues.sort();

    return cgmValues[0];
  }

  // Udregner maximum
  num fetchMaximum() {
    var length = cgmValues.length;
    cgmValues.sort();

    return cgmValues[length - 1];
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
    // List<ChartSampleData> chartData = [];
    chartData = fetchChartData();
    average = fetchAverage();
    min = fetchMininum();
    max = fetchMaximum();
    return Scaffold(
        body: Center(
            child: Column(children: [
      SfCartesianChart(
        enableSideBySideSeriesPlacement: false,

        primaryYAxis: NumericAxis(
            //majorGridLines: MajorGridLines(width: 0.5),
            // axisLine: AxisLine(width: 0.5)
            ),
        primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              //fontFamily: 'Roboto'
            )),
        //  isTransposed: true,
        series: <ChartSeries>[
          // Renders bar chart
          ColumnSeries<ChartSampleData, String>(
            opacity: 0.2,
            dataSource: chartDataBackground,
            xValueMapper: (ChartSampleData data, _) => data.time,
            yValueMapper: (ChartSampleData data, _) => data.bloodSugarLevel,
            pointColorMapper: (ChartSampleData data, _) => data.color,
          ),
          ColumnSeries<ChartSampleData, String>(
            dataSource: chartData,
            xValueMapper: (ChartSampleData data, _) => data.time,
            yValueMapper: (ChartSampleData data, _) => data.bloodSugarLevel,
            pointColorMapper: (ChartSampleData data, _) => data.color,
            dataLabelMapper: (ChartSampleData data, _) => "${data.bloodSugarLevel?.toStringAsFixed(1)}%",
            dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 14, 
               ),
            labelPosition: ChartDataLabelPosition.inside,
            )
          )
        ],
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center, //GNS kasse
        children: [
          const SizedBox(height: 200),
          Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 7,
              shadowColor: const Color.fromARGB(255, 209, 198, 191),
              child: Column(
                children: [

                     const Text(
                      'Average', //overskrift
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
              
                  Container(
                    height: 160,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      //Kolonne med gennemsnit variablen og enheden
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          average
                              .toStringAsFixed(1), //indsæt variabel for average
                          style: const TextStyle(
                              fontSize: 40, color: Colors.black),
                        ),
                        Text(
                          unit, //indsæt variabel for enhed
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(width: 20),
          Column(children: [
            Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 7,
              shadowColor: const Color.fromARGB(255, 209, 198, 191),
              child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
                        child: Text('Minimum'),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Theme.of(context).colorScheme.primary,
                              size: 45,
                            ),
                            Text(
                              min.toStringAsFixed(1),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 7,
              shadowColor: const Color.fromARGB(255, 209, 198, 191),
              child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
                        child: Text('Maximum'),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context).colorScheme.primary,
                              size: 45,
                            ),
                            Text(
                              max.toStringAsFixed(1),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ],
                  )),
            ),
          ])
        ],
      )
    ])));
  }
}

class ChartSampleData {
  final String? time;
  final num? bloodSugarLevel;
  final Color? color;

  ChartSampleData({this.time, this.bloodSugarLevel, this.color});
}
