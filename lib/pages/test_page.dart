import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() =>
      _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
            // Image.asset("images/Google_screenshot.png"), // Indsætter et billede
            const SizedBox(height: 10),
            const Divider(
              color: Colors.amber,
            ), // Skaber et lille mellemrum mellem widgets
            Container(
              margin: const EdgeInsets.all(
                  10.0), // TIlføjer margin på 10px i alle sider af tekstboksen
              padding: const EdgeInsets.all(
                  10.0), // Tilføjer margin på 10px rundt om teksten (gør boksen større i det her tilfælde)
              color: Colors.blueGrey,
              width: double.infinity, // fylder hele bredden af skærmen
              child: const Center(
                child: Text("This is a text widget",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitched ? Colors.green : Colors.blue),
              onPressed: () {
                debugPrint(
                    "Elevated Button"); //debugPrint fortæller hvad der skal vises i terminalen når vi trykker på knappen
              },
              child: const Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Outlined Button");
              },
              child: const Text("Outlined Button"),
            ),
            TextButton(
              onPressed: () {
                debugPrint("Text Button");
              },
              child: const Text("Text Button"),
            ),
            GestureDetector(
              behavior: HitTestBehavior
                  .opaque, // Sørger for at der sker noget når hver kan man trykker et eller andet sted på vores række (helt ud til kanterne), og altså ikke kun på en widget som er i vores row
              onTap: () {
                debugPrint(
                    "This is the row"); // Skriver til terminalen når man trykker på en widget i vores row
              },
              child: const Row(
                // Tilføjer en række af widgets
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centrerer vores widgets i vores row
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text("Row Widget"),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitched,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitched = newBool;
                  });
                }),
            Checkbox(
                value: isBoxChecked,
                onChanged: (bool? newBool) {
                  setState(() {
                    isBoxChecked = newBool;
                  });
                }),
            Image.network(
                "https://wallpaperaccess.com/full/1909531.jpg") // Henter et billede fra nettet
          ],
        ),
      ),
    );
  }
}
