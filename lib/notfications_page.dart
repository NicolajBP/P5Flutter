import 'package:flutter/material.dart';
import 'package:p5/timewheel/hours.dart';
import 'package:p5/timewheel/minutes.dart';
import 'package:p5/timewheel/days.dart';
class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
 

  int currentday = 0;         //Allokerer plads til hvor værdien skal ind.
  int currenthour = 0;
  int currentminute = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Notifications"),
        automaticallyImplyLeading: true, //tilbageknap i appbar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          //dage
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                
                setState((){
                  currentday = value; //Værdien for dage
                  print(value);
                });
              },
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
            width: 10,
          ),


          //Timer
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                
                setState((){
                  currenthour = value; //Værdien for timer
                  print(value);
                });
              },
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
            width: 10,
          ),

          //Minutter
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
                onSelectedItemChanged: (value) {
                
                setState((){
                  currentminute = value;  //Værdien for minut
                  print(currentminute);
                });
              },
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
    );
  }
}