import 'package:flutter/material.dart';

class ReportNutrientIntakePage extends StatefulWidget {
   // ignore: use_key_in_widget_constructors
   const ReportNutrientIntakePage({Key? key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}
class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  bool isSwitched = false;
  bool? isBoxChecked = false;
  
  TimeOfDay _time = TimeOfDay.now(); //Sætter tiden til den nuværende

  int selectedButtonIndex = -1;

  void _selectTime() async { //Funktion der bruger showTimePicker
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  //bools til når knappen er trukket
void resetButtonStates() {
  setState(() {
     isPressed1 = false;
     isPressed2 = false;
     isPressed3 = false;
  });
}
//reset til når andre knapper er trukket ned



  @override
  Widget build(BuildContext context) {    //"kroppen" af siden
    return Scaffold(
      appBar: AppBar(
        title: const Text("P5 CGM app"),
        automaticallyImplyLeading: true,    //tilbageknap i appbar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },



          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(                   //informationsknap i appbar
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
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

Widget _buildPopupDialog(BuildContext context) {    //Widget til popup informations knap
  return AlertDialog(
    title: const Text(
      'Information about portion size',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "A Small portion is everything below or around 100g \nMedium is around 300g \nLarge is around or over 500g \n\n A small portion could be an apple, a medium could be two pieces of bread with topping, and a large portion could be a whole pizza.",
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}