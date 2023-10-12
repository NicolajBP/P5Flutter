import 'package:flutter/material.dart';

int itemCountTrends = 2;

class Trends extends StatelessWidget {
  const Trends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: axisDirectionToAxis(AxisDirection.down),
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              margin: const EdgeInsets.fromLTRB(300, 20, 300, 20),
              padding: const EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              child: const Text("Her kommer der en trend"),
            ),
            Container(
              color: Colors.lightBlue,
              margin: const EdgeInsets.fromLTRB(300, 20, 300, 20),
              padding: const EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              child: const Text("Her kommer der en trend"),
            ),
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

