import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Login/register_page.dart';
import 'package:p5/fetch_cgm_data.dart';
/* import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart'; */

int itemCountTrends = 2;
final user = FirebaseAuth.instance.currentUser!;
var average = 35;
var unit = 'mmol/L';
var minimum = 17;
var maximum = 180;
int daysToAnalyze = 1;

bool isPressed1 = false;
bool isPressed2 = false;
bool isPressed3 = false;
bool isPressed4 = false;
//bools til når tidsknapperne ikke er pressed

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
   DateTime _selectedDate = DateTime(2023,11,8); // Starter på 2. november som standard (data er importeret for 1., 2. og 3. november)

  final dateUpdater =
      ValueNotifier<String>(DateTime.now().toString().substring(0, 10));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Statistics")),
      ),
      body: SingleChildScrollView(
        scrollDirection: axisDirectionToAxis(AxisDirection.down),
        child: Column(
          children: [
           Padding(
              padding: const EdgeInsets.all(10.0),
              child: DatePicker(
                //kalenderbar
                DateTime.now().subtract(const Duration(
                    days: 3)), //vælger hvor mange dage vi kigger tilbage
                height: 80,
                width: 70,
                initialSelectedDate: DateTime.now(),
                selectionColor: Theme.of(context).colorScheme.primary,
                selectedTextColor: Theme.of(context).colorScheme.onPrimary,
                dateTextStyle: const TextStyle(
                    //vi kan ogåså ændre på skriften af de andre
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                onDateChange: (date) {
                  _selectedDate = date; //variabel der kender hvilken dag det er
                  dateUpdater.value = _selectedDate.toString().substring(0, 10);
                  // dateYYYY_MM_DD = _selectedDate.toString().substring(0,10); // Bruges til at indlæse "YYYY-MM-DD" (document ID) fra databasen
                  debugPrint("Selected day: $dateYYYY_MM_DD");
                },
              ),
            ),
             ValueListenableBuilder(
              //TODO 2nd: listen playerPointsToAdd
              valueListenable: dateUpdater,
              builder: (context, value, widget) {
                // TODO here you can setState or whatever you need
                return StatisticWidgets(user.uid, dateUpdater.value, daysToAnalyze);
              },
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

