import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

class ReportNutrientIntakePage extends StatefulWidget {
   // ignore: use_key_in_widget_constructors
   const ReportNutrientIntakePage({Key? key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
      
}

class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  bool isSwitched = false;
  bool? isBoxChecked = false;
  
  String mealSize = "";
  String note = "";
  String time = "";
  TimeOfDay _time = TimeOfDay.now(); //Sætter tiden til den nuværende



void _selectTime() async {
  final TimeOfDay? newTime = await showTimePicker(
    context: context,
    initialTime: _time,
  );
  if (newTime != null) {
    setState(() {
      _time = newTime;
      time = _time.format(context); // definere det tid vi har som tidsvarieble til at gemme 
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
  int selectedButtonIndex = -1;
//en value til kanppen når den er ikke trukket
 
 
void _saveDataToFirestore() async {
  // Define the meal size based on the selected button index
  if (selectedButtonIndex == 0) {
    mealSize = "Small";
  } else if (selectedButtonIndex == 1) {
    mealSize = "Medium";
  } else if (selectedButtonIndex == 2) {
    mealSize = "Large";
  }

  if (mealSize.isNotEmpty && note.isNotEmpty && time.isNotEmpty) {
    try {
      await firestore.collection('nutrition_entries').add({
        'meal_size': mealSize,
        'note': note,
        'time': time,
      });
      debugPrint("Data saved to Firestore.");
      // Reset the form after saving.
      setState(() {
        mealSize = "";
        note = "";
        time = "";
      });
    } catch (e) {
      debugPrint("Error saving data to Firestore: $e");
    }
  }
}



  @override
  Widget build(BuildContext context) {    //"kroppen" af siden
    final isSaveButtonEnabled = mealSize.isNotEmpty && note.isNotEmpty && time.isNotEmpty;
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
              padding: const EdgeInsets.only(top:100.0,bottom: 120),
              child: SizedBox(
                width: 310,
                height: 160,



                
                child: 
                
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 156, 180, 168),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: 'Type of food',
                        ),
                        maxLines: 5,
                        onChanged: (value) {
                          setState(() {
                            note = value;
                          });
                        },
                      ),

              ),
            ),
        
   
  Padding(
    padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
      child: OutlinedButton.icon(              //Sætter ring om "tids knappen"
        onPressed: _selectTime,
        icon: const Icon(Icons.access_time, size: 50.0,),
        label:  Text(_time.format(context), 
        style: const TextStyle(height: 1, fontSize: 36)),
    ),

  ),
            
            const Padding(
              padding: EdgeInsets.only(top:0.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(             //Overskrift til de tre meal sizes
                    "   Choose your meal size:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    //  fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                
        
ElevatedButton( // Small button
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(60, 80),
    backgroundColor: selectedButtonIndex == 0
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  onPressed: () {
    debugPrint("Button 1 Clicked");
    if (selectedButtonIndex == 0) {
      // Reset if the button is already selected
      setState(() {
        selectedButtonIndex = -1;
      });
    } else {
      // Set the clicked button state
      setState(() {
        selectedButtonIndex = 0;
      });
    }
  },
  child: Text("Small",
    style: TextStyle(height: 1, fontSize: 30,
    color: selectedButtonIndex == 0
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.primary),
  ),
),




                const SizedBox(width: 30),


/////////////////////////////////////////////////////////////////////////////////////////////////////
ElevatedButton( // Medium button
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(60, 80),
    backgroundColor: selectedButtonIndex == 1
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  onPressed: () {
    debugPrint("Medium button Clicked");
    if (selectedButtonIndex == 1) {
      // Reset if the button is already selected
      setState(() {
        selectedButtonIndex = -1;
      });
    } else {
      // Set the clicked button state
      setState(() {
        selectedButtonIndex = 1;
      });
    }
  },
  child: Text("Medium",
    style: TextStyle(height: 1, fontSize: 30,
    color: selectedButtonIndex == 1
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.primary),
  ),
),


const SizedBox(width: 30),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ElevatedButton( // Large button
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(60, 80),
    backgroundColor: selectedButtonIndex == 2
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  onPressed: () {
    debugPrint("Large button Clicked");
    if (selectedButtonIndex == 2) {
      // Reset if the button is already selected
      setState(() {
        selectedButtonIndex = -1;
      });
    } else {
      // Set the clicked button state
      setState(() {
        selectedButtonIndex = 2;
      });
    }
  },
  child: Text("Large",
    style: TextStyle(height: 1, fontSize: 30,
    color: selectedButtonIndex == 2
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.primary),
  ),
),


    ],
  ),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(height: 20),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 420, height: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            backgroundColor: isSaveButtonEnabled
                ? MaterialStateProperty.all<Color>(Colors.blue)
                : MaterialStateProperty.all<Color>(Colors.grey), // Change button color
          ),
          onPressed: isSaveButtonEnabled ? _saveDataToFirestore : null,
          child: const Text("Save",
            style: TextStyle(height: 1, fontSize: 30, color: Colors.white),
          ),
        ),
      )
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