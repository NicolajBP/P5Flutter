import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p5/register_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';

class LiveChartWidget extends StatefulWidget {
  final List<dynamic> cgmValues;
  final List<dynamic> cgmTimeStamps;

  LiveChartWidget(this.cgmValues, this.cgmTimeStamps);

  @override
  State<LiveChartWidget> createState() =>
      _LiveChartWidgetState(cgmValues, cgmTimeStamps);
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  final List<dynamic> cgmValues;
  final List<dynamic> cgmTimeStamps;

  _LiveChartWidgetState(this.cgmValues, this.cgmTimeStamps);
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<LiveData> getChartData() {
    List<LiveData> mapLiveData = [];

    for (var i = 0; i < 96; i++) {
      // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapLiveData
          .add(LiveData(time: cgmTimeStamps[i], bloodSugarLevel: cgmValues[i]));
    }

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
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: 'CGM-data'),
          legend: const Legend(isVisible: false),
          series: <ChartSeries>[
            LineSeries<LiveData, DateTime>(
              dataSource: chartData,
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.bloodSugarLevel,
            )
          ],
          primaryXAxis: DateTimeAxis(
              intervalType: DateTimeIntervalType.hours, interval: 1),
          primaryYAxis: NumericAxis(minimum: 70, maximum: 300),
        ),
      ),
    );
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

class LiveData {
  final DateTime? time;
  final num? bloodSugarLevel;
  List<dynamic>? mappedData;

  LiveData({this.time, this.bloodSugarLevel, this.mappedData});
}
