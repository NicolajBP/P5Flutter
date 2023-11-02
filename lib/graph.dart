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
    List<dynamic> mapLiveData = [];


    for (var i = 0; i < 96; i++) { // For-loop for at spare tid på at skrive hvad der skal returneres af <LiveData> nedenfor
      mapLiveData
          .add(LiveData(time: cgmTimeStamps[i], bloodSugarLevel: cgmValues[i]));
    }

    return <LiveData>[
      mapLiveData[1],
      mapLiveData[2],
      mapLiveData[3],
      mapLiveData[4],
      mapLiveData[5],
      mapLiveData[6],
      mapLiveData[7],
      mapLiveData[8],
      mapLiveData[9],
      mapLiveData[10],
      mapLiveData[11],
      mapLiveData[12],
      mapLiveData[13],
      mapLiveData[14],
      mapLiveData[15],
      mapLiveData[16],
      mapLiveData[17],
      mapLiveData[18],
      mapLiveData[19],
      mapLiveData[20],
      mapLiveData[21],
      mapLiveData[22],
      mapLiveData[23],
      mapLiveData[24],
      mapLiveData[25],
      mapLiveData[26],
      mapLiveData[27],
      mapLiveData[28],
      mapLiveData[29],
      mapLiveData[30],
      mapLiveData[31],
      mapLiveData[32],
      mapLiveData[33],
      mapLiveData[34],
      mapLiveData[35],
      mapLiveData[36],
      mapLiveData[37],
      mapLiveData[38],
      mapLiveData[39],
      mapLiveData[40],
      mapLiveData[41],
      mapLiveData[42],
      mapLiveData[43],
      mapLiveData[44],
      mapLiveData[45],
      mapLiveData[46],
      mapLiveData[47],
      mapLiveData[48],
      mapLiveData[49],
      mapLiveData[50],
      mapLiveData[51],
      mapLiveData[52],
      mapLiveData[53],
      mapLiveData[54],
      mapLiveData[55],
      mapLiveData[56],
      mapLiveData[57],
      mapLiveData[58],
      mapLiveData[59],
      mapLiveData[60],
      mapLiveData[61],
      mapLiveData[62],
      mapLiveData[63],
      mapLiveData[64],
      mapLiveData[65],
      mapLiveData[66],
      mapLiveData[67],
      mapLiveData[68],
      mapLiveData[69],
      mapLiveData[70],
      mapLiveData[71],
      mapLiveData[72],
      mapLiveData[73],
      mapLiveData[74],
      mapLiveData[75],
      mapLiveData[76],
      mapLiveData[77],
      mapLiveData[78],
      mapLiveData[79],
      mapLiveData[80],
      mapLiveData[81],
      mapLiveData[82],
      mapLiveData[83],
      mapLiveData[84],
      mapLiveData[85],
      mapLiveData[86],
      mapLiveData[87],
      mapLiveData[88],
      mapLiveData[89],
      mapLiveData[90],
      mapLiveData[91],
      mapLiveData[92],
      mapLiveData[93],
      mapLiveData[94],
      mapLiveData[95],
    ];

//       LiveData(time: cgmTimeStamps[0], bloodSugarLevel: cgmValues[0]),
//       LiveData(time: cgmTimeStamps[1], bloodSugarLevel: cgmValues[1]),
//       LiveData(time: DateTime(2021, 2, 8, 0, 45), bloodSugarLevel: 131.4),
//       LiveData(time: DateTime(2021, 2, 8, 1, 0), bloodSugarLevel: 122.4),
//       LiveData(time: DateTime(2021, 2, 8, 1, 15), bloodSugarLevel: 124.2),
//       LiveData(time: DateTime(2021, 2, 8, 1, 30), bloodSugarLevel: 133.2),
//       LiveData(time: DateTime(2021, 2, 8, 1, 45), bloodSugarLevel: 133.2),
//       LiveData(time: DateTime(2021, 2, 8, 2, 0), bloodSugarLevel: 133.2),
//       LiveData(time: DateTime(2021, 2, 8, 2, 15), bloodSugarLevel: 135),
//       LiveData(time: DateTime(2021, 2, 8, 2, 30), bloodSugarLevel: 136.8),
//       LiveData(time: DateTime(2021, 2, 8, 2, 45), bloodSugarLevel: 138.6),
//       LiveData(time: DateTime(2021, 2, 8, 3, 0), bloodSugarLevel: 135),
//       LiveData(time: DateTime(2021, 2, 8, 3, 15), bloodSugarLevel: 135),
//       LiveData(time: DateTime(2021, 2, 8, 3, 30), bloodSugarLevel: 140.4),
//       LiveData(time: DateTime(2021, 2, 8, 3, 45), bloodSugarLevel: 142.2),
//       LiveData(time: DateTime(2021, 2, 8, 4, 0), bloodSugarLevel: 142.2),
//       LiveData(time: DateTime(2021, 2, 8, 4, 15), bloodSugarLevel: 142.2),
//       LiveData(time: DateTime(2021, 2, 8, 4, 30), bloodSugarLevel: 144),
//       LiveData(time: DateTime(2021, 2, 8, 4, 45), bloodSugarLevel: 145.8),
// // LiveData(time:DateTime(2021,2,8,0,30),bloodSugarLevel:cgmData[1]),
// // LiveData(time:DateTime(2021,2,8,0,45),bloodSugarLevel:cgmData[2]),
// // LiveData(time:DateTime(2021,2,8,1,0),bloodSugarLevel:cgmData[3]),
// // LiveData(time:DateTime(2021,2,8,1,15),bloodSugarLevel:cgmData[4]),
// // LiveData(time:DateTime(2021,2,8,1,30),bloodSugarLevel:cgmData[5]),
// // LiveData(time:DateTime(2021,2,8,1,45),bloodSugarLevel:cgmData[6]),
// // LiveData(time:DateTime(2021,2,8,2,0),bloodSugarLevel:cgmData[7]),
// // LiveData(time:DateTime(2021,2,8,2,15),bloodSugarLevel:cgmData[8]),
// // LiveData(time:DateTime(2021,2,8,2,30),bloodSugarLevel:cgmData[9]),
// // LiveData(time:DateTime(2021,2,8,2,45),bloodSugarLevel:cgmData[10]),
// // LiveData(time:DateTime(2021,2,8,3,0),bloodSugarLevel:cgmData[11]),
// // LiveData(time:DateTime(2021,2,8,3,15),bloodSugarLevel:cgmData[12]),
// // LiveData(time:DateTime(2021,2,8,3,30),bloodSugarLevel:cgmData[13]),
// // LiveData(time:DateTime(2021,2,8,3,45),bloodSugarLevel:cgmData[14]),
// // LiveData(time:DateTime(2021,2,8,4,0),bloodSugarLevel:cgmData[15]),
// // LiveData(time:DateTime(2021,2,8,4,15),bloodSugarLevel:cgmData[16]),
// // LiveData(time:DateTime(2021,2,8,4,30),bloodSugarLevel:cgmData[17]),
// // LiveData(time:DateTime(2021,2,8,4,45),bloodSugarLevel:cgmData[18]),
//       LiveData(time: DateTime(2021, 2, 8, 5, 0), bloodSugarLevel: 145.8),
//       LiveData(time: DateTime(2021, 2, 8, 5, 15), bloodSugarLevel: 138.6),
//       LiveData(time: DateTime(2021, 2, 8, 5, 30), bloodSugarLevel: 136.8),
//       LiveData(time: DateTime(2021, 2, 8, 5, 45), bloodSugarLevel: 136.8),
//       LiveData(time: DateTime(2021, 2, 8, 6, 0), bloodSugarLevel: 138.6),
//       LiveData(time: DateTime(2021, 2, 8, 6, 15), bloodSugarLevel: 140.4),
//       LiveData(time: DateTime(2021, 2, 8, 6, 30), bloodSugarLevel: 144),
//       LiveData(time: DateTime(2021, 2, 8, 6, 45), bloodSugarLevel: 149.4),
//       LiveData(time: DateTime(2021, 2, 8, 7, 0), bloodSugarLevel: 151.2),
//       LiveData(time: DateTime(2021, 2, 8, 7, 15), bloodSugarLevel: 147.6),
//       LiveData(time: DateTime(2021, 2, 8, 7, 30), bloodSugarLevel: 140.4),
//       LiveData(time: DateTime(2021, 2, 8, 7, 45), bloodSugarLevel: 142.2),
//       LiveData(time: DateTime(2021, 2, 8, 8, 0), bloodSugarLevel: 154.8),
//       LiveData(time: DateTime(2021, 2, 8, 8, 15), bloodSugarLevel: 190.8),
//       LiveData(time: DateTime(2021, 2, 8, 8, 30), bloodSugarLevel: 232.2),
//       LiveData(time: DateTime(2021, 2, 8, 8, 45), bloodSugarLevel: 248.4),
//       LiveData(time: DateTime(2021, 2, 8, 9, 0), bloodSugarLevel: 250.2),
//       LiveData(time: DateTime(2021, 2, 8, 9, 15), bloodSugarLevel: 252),
//       LiveData(time: DateTime(2021, 2, 8, 9, 30), bloodSugarLevel: 250.2),
//       LiveData(time: DateTime(2021, 2, 8, 9, 45), bloodSugarLevel: 246.6),
//       LiveData(time: DateTime(2021, 2, 8, 10, 0), bloodSugarLevel: 235.8),
//       LiveData(time: DateTime(2021, 2, 8, 10, 15), bloodSugarLevel: 212.4),
//       LiveData(time: DateTime(2021, 2, 8, 10, 30), bloodSugarLevel: 185.4),
//       LiveData(time: DateTime(2021, 2, 8, 10, 45), bloodSugarLevel: 154.8),
//       LiveData(time: DateTime(2021, 2, 8, 11, 0), bloodSugarLevel: 136.8),
//       LiveData(time: DateTime(2021, 2, 8, 11, 15), bloodSugarLevel: 129.6),
//       LiveData(time: DateTime(2021, 2, 8, 11, 30), bloodSugarLevel: 118.8),
//       LiveData(time: DateTime(2021, 2, 8, 11, 45), bloodSugarLevel: 106.2),
//       LiveData(time: DateTime(2021, 2, 8, 12, 0), bloodSugarLevel: 108),
//       LiveData(time: DateTime(2021, 2, 8, 12, 15), bloodSugarLevel: 133.2),
//       LiveData(time: DateTime(2021, 2, 8, 12, 30), bloodSugarLevel: 172.8),
//       LiveData(time: DateTime(2021, 2, 8, 12, 45), bloodSugarLevel: 196.2),
//       LiveData(time: DateTime(2021, 2, 8, 13, 0), bloodSugarLevel: 207),
//       LiveData(time: DateTime(2021, 2, 8, 13, 15), bloodSugarLevel: 217.8),
//       LiveData(time: DateTime(2021, 2, 8, 13, 30), bloodSugarLevel: 219.6),
//       LiveData(time: DateTime(2021, 2, 8, 13, 45), bloodSugarLevel: 210.6),
//       LiveData(time: DateTime(2021, 2, 8, 14, 0), bloodSugarLevel: 203.4),
//       LiveData(time: DateTime(2021, 2, 8, 14, 15), bloodSugarLevel: 181.8),
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
      primaryXAxis:
          DateTimeAxis(intervalType: DateTimeIntervalType.hours, interval: 1),
      primaryYAxis: NumericAxis(minimum: 70, maximum: 300),
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

class LiveData {
  final DateTime? time;
  final num? bloodSugarLevel;
  List<dynamic>? mappedData;

  LiveData({this.time, this.bloodSugarLevel, this.mappedData});
}
