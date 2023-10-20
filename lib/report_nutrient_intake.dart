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

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100.0,bottom: 180),
              child: SizedBox(
                width: 310,
                height: 110,
                child: TextField(               //Notes kassen
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 156, 180, 168),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'Type of food',
                  ),
                  maxLines: 5,
                ),
              ),
            ),
        
        
  Padding(
    padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
    child: OutlinedButton.icon(              //Sætter ring om "tids knappen"
      onPressed: _selectTime,
    icon: const Icon(Icons.access_time),
    label:  Text(_time.format(context))),
  ),
            
            const Padding(
              padding: EdgeInsets.only(top:0.0, bottom: 20),
              child: Text(             //Overskrift til de tre meal sizes
                "Choose your meal size",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.5,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                
                ElevatedButton(                             // Small button
                 style: ElevatedButton.styleFrom(
                backgroundColor: isPressed1 ? const Color.fromARGB(255, 13, 0, 252) : Colors.blue,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                 ),
                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                     ),
                     onPressed: () {
                      debugPrint("Button 1 Clicked");
                      resetButtonStates();  // Reset all button states
                      setState(() {
                      isPressed1 = true;  // Set the clicked button state
                      });
                      },
                child: const Text("Small"),
                ),




                const SizedBox(width: 30),


/////////////////////////////////////////////////////////////////////////////////////////////////////
                 ElevatedButton(                             // Medium button
                style: ElevatedButton.styleFrom(
                backgroundColor: isPressed2 ? const Color.fromARGB(255, 13, 0, 252) : Colors.blue,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                 ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                 onPressed: () {
    debugPrint("Mid button Clicked");
    resetButtonStates();  // Reset all button states
    setState(() {
      isPressed2 = true;  // Set the clicked button state
    });
  },
  child: const Text("Medium"),
),

const SizedBox(width: 30),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ElevatedButton(                             // Large button
                style: ElevatedButton.styleFrom(
                 backgroundColor: isPressed3 ? const Color.fromARGB(255, 13, 0, 252) : Colors.blue,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                 ),
                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                 ),
               onPressed: () {
                  debugPrint("Large button Clicked");
    resetButtonStates();  // Reset all button states
    setState(() {
      isPressed3 = true;  // Set the clicked button state
    });
  },
  child: const Text("Large"),
),

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ],
            ),
            const SizedBox(height: 20),
            ConstrainedBox(                                           //Save button
              constraints: const BoxConstraints.tightFor(width: 280, height: 42),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  debugPrint("Save Button Clicked");
                },
                child: const Text("Save"),
              ),
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