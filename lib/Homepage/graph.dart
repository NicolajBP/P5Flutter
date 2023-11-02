import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p5/Login/register_page.dart';
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
  late ZoomPanBehavior _zoomPanBehavior;
  final List<dynamic> cgmValues;
  final List<dynamic> cgmTimeStamps;

  _LiveChartWidgetState(this.cgmValues, this.cgmTimeStamps);
  /*  late ChartSeriesController _chartSeriesController; */

@override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(
                  enableSelectionZooming: true,
                  selectionRectBorderColor: Colors.red,
                  selectionRectBorderWidth: 1,
                  selectionRectColor: Colors.grey
                );
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
    return Scaffold(
        body: Center(
            child: Container(
                child: Column(
      children: [
        SfCartesianChart(
          zoomPanBehavior: _zoomPanBehavior,
          title: ChartTitle(text: 'CGM-data'),
          legend: const Legend(isVisible: false),
          series: <ChartSeries>[
            LineSeries<LiveData, DateTime>(
              dataSource: chartData,
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.bloodSugarLevel,
            ),
            // ScatterSeries<LiveData, DateTime>(
            //   dataSource: chartData,
            //   xValueMapper: (LiveData data, _) => data.time,
            //   yValueMapper: (LiveData data, _) => data.neutrientIntake,
            //   markerSettings:const MarkerSettings(
            //     shape: DataMarkerType.image,
            //     height: 10,
            //     width: 10,
            //     image: NetworkImage('images/INTAKE.png')
            //   )
            //   ),
            //   ScatterSeries<LiveData, DateTime>(
            //   dataSource: chartData,
            //   xValueMapper: (LiveData data, _) => data.time,
            //   yValueMapper: (LiveData data, _) => data.exercise,
            //   markerSettings:const MarkerSettings(
            //     shape: DataMarkerType.image,
            //     height: 10,
            //     width: 10,
            //     image: NetworkImage('images/EXERCISE.png')
            //   )
            //   )
          ],
          primaryXAxis: DateTimeAxis(
              intervalType: DateTimeIntervalType.auto,
              interval: 1,
              plotBands: <PlotBand>[
                //grøn bånd
                PlotBand(
                  isVisible: true,
                  start: cgmTimeStamps[0], //x-aksen start - går nok galt når vi ændrer dagen
                  end: cgmTimeStamps[95],
                  associatedAxisStart: 120, //y-aksen start
                  associatedAxisEnd: 200,
                  shouldRenderAboveSeries: false,
                  color: const Color.fromARGB(5, 197, 239, 197), //farve
                  opacity: 0.5, //gennemsigtighed (0-1)
                ),
              ]),
          primaryYAxis:
              NumericAxis(minimum: 70, maximum: 300, plotBands: <PlotBand>[
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
    )
    )
    )
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