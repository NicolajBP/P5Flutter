import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';


class LiveChartWidget extends StatefulWidget {
  @override
  State<LiveChartWidget> createState() => _LiveChartWidgetState();
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

// Den behøver ikke opdatere hele tiden, den opdatere hver gang man går på homepage,så hvis den downloader data fra firebase inden opdatere den fint

  List<LiveData> getChartData() {
    return <LiveData>[
      
LiveData(time:DateTime(2021,2,8,0,15),speed:133.2),
LiveData(time:DateTime(2021,2,8,0,30),speed:129.6),
LiveData(time:DateTime(2021,2,8,0,45),speed:131.4),
LiveData(time:DateTime(2021,2,8,1,0),speed:122.4),
LiveData(time:DateTime(2021,2,8,1,15),speed:124.2),
LiveData(time:DateTime(2021,2,8,1,30),speed:133.2),
LiveData(time:DateTime(2021,2,8,1,45),speed:133.2),
LiveData(time:DateTime(2021,2,8,2,0),speed:133.2),
LiveData(time:DateTime(2021,2,8,2,15),speed:135),
LiveData(time:DateTime(2021,2,8,2,30),speed:136.8),
LiveData(time:DateTime(2021,2,8,2,45),speed:138.6),
LiveData(time:DateTime(2021,2,8,3,0),speed:135),
LiveData(time:DateTime(2021,2,8,3,15),speed:135),
LiveData(time:DateTime(2021,2,8,3,30),speed:140.4),
LiveData(time:DateTime(2021,2,8,3,45),speed:142.2),
LiveData(time:DateTime(2021,2,8,4,0),speed:142.2),
LiveData(time:DateTime(2021,2,8,4,15),speed:142.2),
LiveData(time:DateTime(2021,2,8,4,30),speed:144),
LiveData(time:DateTime(2021,2,8,4,45),speed:145.8),
LiveData(time:DateTime(2021,2,8,5,0),speed:145.8),
LiveData(time:DateTime(2021,2,8,5,15),speed:138.6),
LiveData(time:DateTime(2021,2,8,5,30),speed:136.8),
LiveData(time:DateTime(2021,2,8,5,45),speed:136.8),
LiveData(time:DateTime(2021,2,8,6,0),speed:138.6),
LiveData(time:DateTime(2021,2,8,6,15),speed:140.4),
LiveData(time:DateTime(2021,2,8,6,30),speed:144),
LiveData(time:DateTime(2021,2,8,6,45),speed:149.4),
LiveData(time:DateTime(2021,2,8,7,0),speed:151.2),
LiveData(time:DateTime(2021,2,8,7,15),speed:147.6),
LiveData(time:DateTime(2021,2,8,7,30),speed:140.4),
LiveData(time:DateTime(2021,2,8,7,45),speed:142.2),
LiveData(time:DateTime(2021,2,8,8,0),speed:154.8),
LiveData(time:DateTime(2021,2,8,8,15),speed:190.8),
LiveData(time:DateTime(2021,2,8,8,30),speed:232.2),
LiveData(time:DateTime(2021,2,8,8,45),speed:248.4),
LiveData(time:DateTime(2021,2,8,9,0),speed:250.2),
LiveData(time:DateTime(2021,2,8,9,15),speed:252),
LiveData(time:DateTime(2021,2,8,9,30),speed:250.2),
LiveData(time:DateTime(2021,2,8,9,45),speed:246.6),
LiveData(time:DateTime(2021,2,8,10,0),speed:235.8),
LiveData(time:DateTime(2021,2,8,10,15),speed:212.4),
LiveData(time:DateTime(2021,2,8,10,30),speed:185.4),
LiveData(time:DateTime(2021,2,8,10,45),speed:154.8),
LiveData(time:DateTime(2021,2,8,11,0),speed:136.8),
LiveData(time:DateTime(2021,2,8,11,15),speed:129.6),
LiveData(time:DateTime(2021,2,8,11,30),speed:118.8),
LiveData(time:DateTime(2021,2,8,11,45),speed:106.2),
LiveData(time:DateTime(2021,2,8,12,0),speed:108),
LiveData(time:DateTime(2021,2,8,12,15),speed:133.2),
LiveData(time:DateTime(2021,2,8,12,30),speed:172.8),
LiveData(time:DateTime(2021,2,8,12,45),speed:196.2),
LiveData(time:DateTime(2021,2,8,13,0),speed:207),
LiveData(time:DateTime(2021,2,8,13,15),speed:217.8),
LiveData(time:DateTime(2021,2,8,13,30),speed:219.6),
LiveData(time:DateTime(2021,2,8,13,45),speed:210.6),
LiveData(time:DateTime(2021,2,8,14,0),speed:203.4),
LiveData(time:DateTime(2021,2,8,14,15),speed:181.8),

    ];

    
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
    
    final List<LineData1> lineData1 = <LineData1>[
            LineData1(DateTime(2021,2,8,0,0),220),
            LineData1(DateTime(2021,2,8,14,0),220),
        ];
    
    final List<LineData2> lineData2 = <LineData2>[
            LineData2(DateTime(2021,2,8,0,0),110),
            LineData2(DateTime(2021,2,8,14,0),110),
        ];


    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
      title: ChartTitle(text: 'CGM-data'),
      legend: const Legend(isVisible: false),
      series: <ChartSeries>[
        LineSeries<LiveData, DateTime>(
          dataSource: chartData,
          xValueMapper: (LiveData data, _) => data.time,
          yValueMapper: (LiveData data, _) => data.speed,
        ),
        LineSeries<LineData1, DateTime>(
          dataSource: lineData1,
           dashArray: <double>[5, 5],
           color: Colors.red,
          xValueMapper: (LineData1 data, _) => data.time,
          yValueMapper: (LineData1 data, _) => data.y1,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
           )
           ),
          LineSeries<LineData2, DateTime>(
          dataSource: lineData2,
           dashArray: <double>[5, 5],
           color: Colors.red,
          xValueMapper: (LineData2 data, _) => data.time,
          yValueMapper: (LineData2 data, _) => data.y2,
           ),
      ],
      primaryXAxis: DateTimeAxis(intervalType: DateTimeIntervalType.hours, interval:1),
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
            yValueMapper: (LiveData data,_)=> data.speed,
          )
        ],
      ),

    ),
    );
  } */
}

class LiveData {
  final DateTime? time;
  final num? speed;

  LiveData({this.time, this.speed});
}

  class LineData1 {
        LineData1(this.time, this.y1);
        final DateTime? time;
        final int y1;
    }

  class LineData2 {
        LineData2(this.time, this.y2);
        final DateTime? time;
        final int y2;
    }