import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class LiveChartWidget extends StatefulWidget {
  @override
  State<LiveChartWidget> createState() => _LiveChartWidgetState();
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData;
  late List<Register> registerData;
  /*  late ChartSeriesController _chartSeriesController; */

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    registerData = getRegisterData();
    /* Timer.periodic(const Duration(seconds: 1), updateDataSource); */
  }

List<Register> getRegisterData(){
  return <Register>[
    Register(times:DateTime(2021,2,8,0,15)),
    Register(times:DateTime(2021,2,8,0,30)),
    Register(times:DateTime(2021,2,8,0,45)),
    Register(times:DateTime(2021,2,8,1,0)),
    Register(times:DateTime(2021,2,8,1,15)),
    Register(times:DateTime(2021,2,8,1,30)),
    Register(times:DateTime(2021,2,8,1,45)),
    Register(times:DateTime(2021,2,8,2,0)),
    Register(times:DateTime(2021,2,8,2,15)),
    Register(times:DateTime(2021,2,8,2,30)),
    Register(times:DateTime(2021,2,8,2,45)),
    Register(times:DateTime(2021,2,8,3,0)),
    Register(times:DateTime(2021,2,8,3,15)),
    Register(times:DateTime(2021,2,8,3,30)),
    Register(times:DateTime(2021,2,8,3,45)),
    Register(times:DateTime(2021,2,8,4,0)),
    Register(times:DateTime(2021,2,8,4,15)),
    Register(times:DateTime(2021,2,8,4,30)),
    Register(times:DateTime(2021,2,8,4,45)),
    Register(times:DateTime(2021,2,8,5,0)),
    Register(times:DateTime(2021,2,8,5,15)),
    Register(times:DateTime(2021,2,8,5,30)),
    Register(times:DateTime(2021,2,8,5,45)),
    Register(times:DateTime(2021,2,8,6,0)),
    Register(times:DateTime(2021,2,8,6,15)),
    Register(times:DateTime(2021,2,8,6,30)),
    Register(times:DateTime(2021,2,8,6,45)),
    Register(times:DateTime(2021,2,8,7,0),eating: 1),
    Register(times:DateTime(2021,2,8,7,15)),
    Register(times:DateTime(2021,2,8,7,30)),
    Register(times:DateTime(2021,2,8,7,45)),
    Register(times:DateTime(2021,2,8,8,0)),
    Register(times:DateTime(2021,2,8,8,15)),
    Register(times:DateTime(2021,2,8,8,30)),
    Register(times:DateTime(2021,2,8,8,45)),
    Register(times:DateTime(2021,2,8,9,0)),
    Register(times:DateTime(2021,2,8,9,15)),
    Register(times:DateTime(2021,2,8,9,30)),
    Register(times:DateTime(2021,2,8,9,45)),
    Register(times:DateTime(2021,2,8,10,0),eating: 1),
    Register(times:DateTime(2021,2,8,10,15)),
    Register(times:DateTime(2021,2,8,10,30)),
    Register(times:DateTime(2021,2,8,10,45)),
    Register(times:DateTime(2021,2,8,11,0)),
    Register(times:DateTime(2021,2,8,11,15)),
    Register(times:DateTime(2021,2,8,11,30),exercise: 1),
    Register(times:DateTime(2021,2,8,11,45)),
    Register(times:DateTime(2021,2,8,12,0)),
    Register(times:DateTime(2021,2,8,12,15)),
    Register(times:DateTime(2021,2,8,12,30)),
    Register(times:DateTime(2021,2,8,12,45)),
    Register(times:DateTime(2021,2,8,13,0)),
    Register(times:DateTime(2021,2,8,13,15)),
    Register(times:DateTime(2021,2,8,13,30)),
    Register(times:DateTime(2021,2,8,13,45)),
    Register(times:DateTime(2021,2,8,14,0)),
    Register(times:DateTime(2021,2,8,14,15)),
  ];
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
  return Scaffold(
            body: Center(
                child: Container(
                    child: Column(children: [
                      Container(
                        child: SfCartesianChart(
                          title: ChartTitle(text: 'CGM-data'),
                          legend: const Legend(isVisible: false),
                          series: <ChartSeries>[
                            LineSeries<LiveData, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (LiveData data, _) => data.time,
                              yValueMapper: (LiveData data, _) => data.speed,
                            ),
                          ],
                          primaryXAxis: DateTimeAxis(
                          intervalType: DateTimeIntervalType.auto, interval:1,
                          plotBands: <PlotBand>[                                      //grøn bånd
                                PlotBand(
                                isVisible: true,
                                start: DateTime(2021,2,8,0,0),      //x-aksen start - går nok galt når vi ændrer dagen
                                end: DateTime(2021,2,8,14,15),
                                associatedAxisStart: 120,           //y-aksen start
                                associatedAxisEnd: 200,
                                shouldRenderAboveSeries: false,
                                color: const Color.fromARGB(5, 197, 239, 197),    //farve
                                opacity: 0.5,                                      //gennemsigtighed (0-1)
                                ),
                            ]
                          ),
                          primaryYAxis: NumericAxis(
                            minimum: 70,
                            maximum: 300,
                            plotBands: <PlotBand>[
                              PlotBand(                             //LOW stiplet linje
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
                              PlotBand(                             //HIGH stiplet linje
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
                                  ]
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 50,
                          child: SfCartesianChart(
                            legend: const Legend(isVisible: false),
                            series: <ChartSeries>[
                              ScatterSeries<Register, DateTime>(
                                dataSource: registerData,
                                xValueMapper: (Register data, _) => data.times,
                                yValueMapper: (Register data, _) => data.eating,
                                markerSettings: const MarkerSettings(height: 15,
                                      width: 15,
                                      // Scatter will render in diamond shape
                                      shape: DataMarkerType.diamond
                                      )
                              ),
                            ],
                            primaryXAxis: DateTimeAxis(
                            intervalType: DateTimeIntervalType.auto, interval:1,
                            isVisible: false),
                            primaryYAxis: NumericAxis(minimum: 0, maximum: 2,interval: 2,
                            isVisible: false
                            )
                        ),
                                          ),
                      )
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


class Register {
  final DateTime? times;
  final num? eating;
  final num? exercise;
  Register({this.eating, this.times, this.exercise});
}