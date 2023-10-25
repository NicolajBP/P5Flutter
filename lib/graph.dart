import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChartWidget extends StatefulWidget {
 

  @override
  State<LiveChartWidget> createState() => _LiveChartWidgetState();
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

@override
  void initState() {
  
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

List<LiveData> getChartData(){
  return <LiveData>[
    LiveData(0,42),
    LiveData(1,42),
    LiveData(2,42),
    LiveData(3,42),
    LiveData(4,42),
    LiveData(5,42),
    LiveData(6,42),
    LiveData(7,42),
    LiveData(8,42),
    LiveData(9,42),
    LiveData(10,42),
  ];
}

 int time =11;
updateDataSource(Timer timer){
  chartData.add(LiveData(time++, (math.Random().nextInt(60))));
  chartData.remove(0);
  _chartSeriesController.updateDataSource(
    addedDataIndex: chartData.length-1, removedDataIndex: 0
  );

}





  @override
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
  }
}


class LiveData{
  final int time;
  final num speed;

  LiveData(this.time, this.speed);
}