import 'package:flutter/material.dart';
import 'package:p5/timewheel/hours.dart';
import 'package:p5/timewheel/minutes.dart';
import 'package:p5/timewheel/days.dart';
class TimeWheel extends StatefulWidget {
  const TimeWheel({super.key});

  @override
  State<TimeWheel> createState() => _TimeWheelState();
}

class _TimeWheelState extends State<TimeWheel> {
 late FixedExtentScrollController _controller;
 late FixedExtentScrollController _controller1;
 late FixedExtentScrollController _controller2;

@override
void initState() {
  super.initState();

  _controller = FixedExtentScrollController();
  _controller1 = FixedExtentScrollController();
  _controller2 = FixedExtentScrollController();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //      onPressed: () {
    //        Navigator.of(context).pop();
      body: SizedBox(
        width: 300,
        height: 170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //dage
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controller,
                itemExtent: 50, 
                perspective: 0.005, //Perspektivet på hjulet
                diameterRatio: 1.3,//Diameter af hjulet
                physics: const FixedExtentScrollPhysics(), //Sørger for den altid ender på et tal.
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 8, //Mængde af tal vi vil have i hjulet
                  builder: (context, index) {
                    return MyDays(
                      days: index,
                    );
                  },
                ),
              ),
            ),
      
            const SizedBox(
              width: 20,
            ),
      
      
            //Timer 
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controller1,
                itemExtent: 50, 
                perspective: 0.005, //Perspektivet på hjulet
                diameterRatio: 1.3, //Diameter af hjulet
                physics: const FixedExtentScrollPhysics(), //Sørger for den altid ender på et tal.
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 24, //Mængde af tal vi vil have i hjulet
                  builder: (context, index) {
                    return MyHours(
                      hours: index,
                    );
                  }
                ),
              ),
            ),
      
            const SizedBox(
              width: 20,
            ),
      
            //Minutter
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controller2,
                itemExtent: 50, 
                perspective: 0.005,//Perspektivet på hjulet
                diameterRatio: 1.3, //Diameter af hjulet
                physics: const FixedExtentScrollPhysics(), //Sørger for den altid ender på et tal.
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,  //Mængde af tal vi vil have i hjulet
                  builder: (context, index) {
                    return MyMinutes(
                      mins: index,
                    );
                  }
                ),
              ),
            ),
          ]
        ),
      ), 
    );
  }
}