import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Login/register_page.dart';
import 'package:p5/fetch_cgm_data.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';

int itemCountTrends = 2;
final user = FirebaseAuth.instance.currentUser!;
var average = 35;
var unit = 'mmol/L';
var minimum = 17;
var maximum = 180;

bool isPressed1 = false;
bool isPressed2 = false;
bool isPressed3 = false;
bool isPressed4 = false;
//bools til når tidsknapperne ikke er pressed

class Trends extends StatefulWidget {
  const Trends({super.key});

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
      ),
      body: SingleChildScrollView(
        scrollDirection: axisDirectionToAxis(AxisDirection.down),
        child: Column(
          children: [
             Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
              onPressed: () {
                if (isPressed1 == false) { 
                setState(() {
                  isPressed1 = true;
                  isPressed2 = false;
                  isPressed3 = false;
                  isPressed4 = false;
                });}
                else {
                  setState(() {
                    isPressed1=false;
                  });
                }
              },  
              style: OutlinedButton.styleFrom(
              side:  BorderSide(color: Theme.of(context).colorScheme.primary),
              backgroundColor: isPressed1 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary
               ),
               child: Text("7 d",
               style: TextStyle(
                color: isPressed1 ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary )),
            ),

            OutlinedButton(
              onPressed: () {
              if (isPressed2 == false) { 
                setState(() {
                  isPressed2 = true;
                  isPressed1 = false;
                  isPressed3 = false;
                  isPressed4 = false;
                });}
                else {
                  setState(() {
                    isPressed2=false;
                  });
                }
              },  
              style: OutlinedButton.styleFrom(
              side:  BorderSide(color: Theme.of(context).colorScheme.primary),
              backgroundColor: isPressed2 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary
               ),
              child: Text("3 d",
              style: TextStyle(
                color: isPressed2 ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary )),
            
            ),
            OutlinedButton(
              onPressed: () {
                  if (isPressed3 == false) { 
                setState(() {
                  isPressed3 = true;
                  isPressed2 = false;
                  isPressed1 = false;
                  isPressed4 = false;
                });}
                else {
                  setState(() {
                    isPressed3=false;
                  });
                }
              },  
              style: OutlinedButton.styleFrom(
              side:  BorderSide(color: Theme.of(context).colorScheme.primary),
              backgroundColor: isPressed3 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary
               ),
              child: Text("24h",
              style: TextStyle(
                color: isPressed3 ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary )),
            ),
            OutlinedButton(
             onPressed: () {
                if (isPressed4 == false) { 
                setState(() {
                  isPressed4 = true;
                  isPressed2 = false;
                  isPressed3 = false;
                  isPressed1 = false;
                });}
                else {
                  setState(() {
                    isPressed4=false;
                  });
                } 
              },  
              style: OutlinedButton.styleFrom(
              side:  BorderSide(color: Theme.of(context).colorScheme.primary),
              backgroundColor: isPressed4 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary
               ),
              child: Text("Today",
              style: TextStyle(
                color: isPressed4 ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary )),
            ),
    ],),
                      FetchStatsPage(user.uid, dateYYYY_MM_DD),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,      //GNS kasse
        children: [
        Material(
          borderRadius: BorderRadius.circular(15.0),
          elevation: 7,
          shadowColor: const Color.fromARGB(255, 209, 198, 191),    
      child: Column(children: [
        const Text('Average',             //overskrift
            style: TextStyle(
              fontSize: 14,
              color: Colors.black
              ),), 
      Container(
          height: 180,
          width: 190,
        decoration: const BoxDecoration(
        color: Colors.transparent,
          ),
        child: Column(                                       //Kolonne med gennemsnit variablen og enheden
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(average.toString(),                        //indsæt variabel for average
            style: const TextStyle(
              fontSize: 60,
              color: Colors.black
            ),),
            Text(unit,                                        //indsæt variabel for enhed
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14 ),)
          ],)
        ),
        ],)
      ),
       
      const SizedBox(width: 50),
  
        Column(
        children: [
        Material(
          borderRadius: BorderRadius.circular(15.0),
          elevation: 7,
          shadowColor: const Color.fromARGB(255, 209, 198, 191), 
          child: 
          Container(
            height: 95,
            width: 190,
            decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
            Radius.circular(15.0),),
            ),
            child: Column(
            children: [
            const Text('Minimum'),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            Icon(Icons.arrow_downward,
            color: Theme.of(context).colorScheme.primary,
            size: 55,),
            Text(minimum.toString(), 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
        ]),
        ],)
          ),
        ),

  const SizedBox(height: 10,),

        Material( 
          borderRadius: BorderRadius.circular(15.0),
          elevation: 7,
          shadowColor: const Color.fromARGB(255, 209, 198, 191),
          child: Container(
            height: 95,
            width: 190,
            decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
            Radius.circular(15.0),),
            ),
            child: Column(
            children: [
            const Text('Maximum'),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            Icon(Icons.arrow_upward,
            color: Theme.of(context).colorScheme.primary,
            size: 55,),
            Text(maximum.toString(), 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
        ]),
        ],)
        ),
        ),
        ])
    ],)
            
            
          ],
        ),
      ),
    );
  }
}





//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: itemCountTrends,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
          
//           title: Text("Item ${(index+1)}"),
//           leading: const Icon(Icons.perm_contact_cal_rounded),
//           trailing: const Icon(Icons.check_box_outline_blank_rounded),
//           onTap: (){
//             debugPrint("Item ${(index+1)}");
//           },
//         );
//       },
//     );
//   }
// }

