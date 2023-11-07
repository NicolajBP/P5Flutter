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
  // late FixedExtentScrollController _controllerday;
//  late FixedExtentScrollController _controllerhour;
//  late FixedExtentScrollController _controllerminute;

 int currentDay = 0;
 late String stringDay = "$currentDay";
 int currentHour = 12;
 late String stringHour = "$currentHour";
 int currentMinute = 0;
 late String stringMinute = "$currentMinute";

// @override
// void initState() {
//   super.initState();

  // _controllerday = FixedExtentScrollController();
  // _controllerhour = FixedExtentScrollController();
  // _controllerminute = FixedExtentScrollController();
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 600,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //dage
            SizedBox(
              width: 100,
              child: ListWheelScrollView.useDelegate(
                // controller: _controllerday,
                itemExtent: 50, 
                onSelectedItemChanged: (value) {
                  setState(() {
                    currentDay = value;
                  });
                },
                perspective: 0.005, //Perspektivet på hjulet
                diameterRatio: 1.3,//Diameter af hjulet
                useMagnifier: true,
                magnification: 1.5,
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
              width: 100,
              child: ListWheelScrollView.useDelegate(
                // controller: _controllerhour,
                itemExtent: 50, 
                onSelectedItemChanged: (value) {
                  setState(() {
                    currentHour = value;
                  });
                },
                perspective: 0.005, //Perspektivet på hjulet
                diameterRatio: 1.3, //Diameter af hjulet
                useMagnifier: true,
                magnification: 1.5,
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
              width: 100,
              child: ListWheelScrollView.useDelegate(
                // controller: _controllerminute,
                itemExtent: 50, 
                onSelectedItemChanged: (value) {
                  setState(() {
                    currentMinute = value;
                  });
                },
                perspective: 0.005,//Perspektivet på hjulet
                diameterRatio: 1.3, //Diameter af hjulet
                useMagnifier: true,
                magnification: 1.5,
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