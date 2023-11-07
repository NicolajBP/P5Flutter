import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Login/register_page.dart';
import 'package:p5/fetch_cgm_data.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';

int itemCountTrends = 2;
 final user = FirebaseAuth.instance.currentUser!;

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
           FetchCgmData(user.uid, dateYYYY_MM_DD),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
              color: Colors.lightBlue,
              // margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              // padding: const EdgeInsets.all(20),
              height: 200,
              width: 190,
              child: const Text("Her kommer der en trend"),
            ),
      const SizedBox(width: 30),
        Container(
              color: Colors.lightBlue,
              // margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              // padding: const EdgeInsets.all(20),
              height: 200,
              width: 190,
              child: const Text("Her kommer der en trend"),
            ),
    ],)
            
            
            
            // Container(
            //   color: Colors.lightBlue,
            //   margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            //   padding: const EdgeInsets.all(20),
            //   height: 200,
            //   width: double.infinity,
            //   child: const Text("Her kommer der en trend"),
            // ),
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

