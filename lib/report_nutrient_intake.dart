import 'package:flutter/material.dart';

class ReportNutrientIntakePage extends StatefulWidget {
  const ReportNutrientIntakePage({super.key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}

class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  bool isSwitched =
      false; // Husk at deklarering af variable skal ske inden vores override og build
  bool? isBoxChecked = false; // bool? betyder nullable bool

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P5 CGM app"),
        automaticallyImplyLeading:
            true, // Fjerner automatisk genereret tilbageknap
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Tager os tilbage til den forrige side --> pop() betyder at vi fjerner den nuværende side
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Actions");
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // Tilføjer sådan set bare en søjle af widgets
            children: [
              // children tillader os at tilføje mere end én widget
    const SizedBox(height: 10),
   Container(
  width: 280, // Set the desired width
  height: 110, // Set the desired height 
child:TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
    ),
    hintText: 'Type of food',
  ),
  maxLines: 4,
),
   ),
            
            
          
            const SizedBox(height: 250),
            
            
            Row(
            //skaber en rækker af widgets
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //centerer vores knapper

            children: [



            ElevatedButton(
            onPressed: () {
            debugPrint("Button 1 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Small"),//tekst indenfor knappen
            ),
            const SizedBox(width: 5), // afstand mellem knapper
    


            ElevatedButton(
            onPressed: () {
           debugPrint("Button 2 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Medium"),//tekst indenfor knappen
            ),
    
            const SizedBox(width: 1), // afstand mellem knapper 
            
            
            ElevatedButton(
            onPressed: () {
            debugPrint("Button 3 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Large"),//tekst indenfor knappen
              ),
              ],
            ),
,

      ElevatedButton(
        onPressed: () {
          debugPrint("Save Button Clicked");
        },
        child: const Text("Save"),
      )
          ],
        ),
      ),
    );
  }
}
