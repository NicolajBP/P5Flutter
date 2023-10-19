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
        title: const Text("P5"),
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
            // Image.asset("images/Google_screenshot.png"), // Indsætter et billede
            const SizedBox(height: 10),

            Row(
              // Tilføjer en række af widgets
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centrerer vores widgets i vores row
              children: [
                const SizedBox(height: 125),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type of food',
                    ),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Weight (g)',
                    ),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Carbohydrates (g)',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      debugPrint(
                          "Elevated Button"); //debugPrint fortæller hvad der skal vises i terminalen når vi trykker på knappen
                    },
                    child: const Text("Add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
