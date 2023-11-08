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

class Trends extends StatelessWidget {
  const Trends({super.key});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              onPressed: () {
                debugPrint("Button");
              },
              child: const Text("Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Outlined Button");
              },
              child: const Text("Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Button");
              },
              child: const Text("Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Button");
              },
              child: const Text("Button"),
            ),
    ],),
            Container(
              color: Colors.lightBlue,
              margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              padding: const EdgeInsets.all(20),
              height: 300,
              width: double.infinity,
              child: const Text("Her kommer der en trend"),
            ),
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
            const Text('17.0', 
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
            const Text('180.0', 
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

