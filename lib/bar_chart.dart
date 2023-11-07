import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:p5/Login/register_page.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: unused_import
import 'package:excel/excel.dart';
// ignore: unused_import
import 'dart:io';
// ignore: depend_on_referenced_packages, unused_import
import 'package:path/path.dart';

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
    List<ChartSampleData> mapLiveData = [];
    // List<ChartSampleData > chartData = [];
    num sum = 0;
    num low = 0;
    num inRange = 0;
    num high = 0;
    for (var i = 0; i < 96; i++) {
      // Vi indlæser alt data til grafen i en for loop
      // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapLiveData.add(
        ChartSampleData(
          // time: cgmTimeStamps[i],
          bloodSugarLevel: cgmValues[i],
        ),
      );
      sum += cgmValues[i];

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

    num average = sum / cgmValues.length;

    chartData = <ChartSampleData>[
      ChartSampleData(time: "Low", bloodSugarLevel: low),
      ChartSampleData(time: "In Range", bloodSugarLevel: inRange),
      ChartSampleData(time: "High", bloodSugarLevel: high),
    ];

    // return mapLiveData;
    return chartData;
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
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    //  isTransposed: true,
                    series: <ChartSeries>[
          // Renders bar chart
          ColumnSeries<ChartSampleData, String>(
              dataSource: chartData,
              xValueMapper: (ChartSampleData data, _) => data.time,
              yValueMapper: (ChartSampleData data, _) => data.bloodSugarLevel)
        ]))));
  }
}

class ChartSampleData {
  final String? time;
  final num? bloodSugarLevel;

  ChartSampleData({this.time, this.bloodSugarLevel});
}
