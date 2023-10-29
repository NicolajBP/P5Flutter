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
    // Firestore instance til at interegerer med databasen.

  bool isSwitched = false;
  bool? isBoxChecked = false;
  
  String mealSize = "";
  String note = "";
  String time = "";
  //definere input varibler som strings
  TimeOfDay _time = TimeOfDay.now(); //Sætter tiden til den nuværende

final TextEditingController noteController = TextEditingController();

  // Tids valg metode
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
 //
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  //bools til når knappen er ikke trukket


void resetButtonStates() {
  setState(() {
     isPressed1 = false;
     isPressed2 = false;
     isPressed3 = false;
  });
}
//funktionen der nulstiller knapperne


  int selectedButtonIndex = -1;
//en værdi til kanppen når den er ikke trukket
 
 
 //data gemmes med denne funktion
void _saveDataToFirestore() async {
  // Opret en liste til at gemme navnene på de manglende felter
  List<String> manglendeFelter = [];

  if (selectedButtonIndex == -1) {
    // Hvis intet knap til valg af portionsstørrelse er valgt
    
    manglendeFelter.add("Meal Size");
  }
  // tilføj "Meal Size" til listen over manglende felter
  if (note.isEmpty) {
    // Hvis feltet til notater er tomt
    // tilføj "Note" til listen over manglende felter
    manglendeFelter.add("Note");
  }


  if (manglendeFelter.isNotEmpty) {
    // Vis en fejlmeddelelse med de manglende felter som en Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Udfyld venligst følgende felter: ${manglendeFelter.join(", ")}.'),
      duration: const Duration(seconds: 3), // Justér varigheden efter behov
    ));
    return; // retunere uden at gemme data
  }

  // Definer portionsstørelsen baseret på den valgt knaps indeks
  String mealSize = "";
  if (selectedButtonIndex == 0) {
    mealSize = "Small";
  } else if (selectedButtonIndex == 1) {
    mealSize = "Medium";
  } else if (selectedButtonIndex == 2) {
    mealSize = "Large";
  }

  if (time.isEmpty) {
    // If the time is empty, update it with the current time
    time = _time.format(context);
  }


  try {
    // Gem data i Firestore-databasen
    await firestore.collection('nutrition_entries').add({
      'meal_size': mealSize,
      'note': note,
      'time': time,
      
    });
      // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Data is saved successfully.'),
    duration: Duration(seconds: 3), // Ændre længden af display
  ),
);

    debugPrint("The data is saved  to Firestore.");

    // Nulstil formularen efter at dataen er blevet gemt
       setState(() {
      selectedButtonIndex = -1;
      note = ""; // Clear the note text field
      time = ""; 
    });
  } catch (e) {
    debugPrint("Error saving to Firestoe $e");
  }
}


@override
void initState() {
  super.initState();
  noteController.text = note; // Initialize the controller with the current value of 'note'
}



  @override
  void dispose() {
  //sletter alt det bliver skrevet i note boks når data er gemt. 
  noteController.dispose();
  super.dispose();
}

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
              padding: const EdgeInsets.only(top:100.0,bottom: 120),
              child: SizedBox(
                width: 310,
                height: 160,



                
                child: 
 ////////////////TextBox/////////////////////               
        TextField(
        controller: noteController, // Use the controller to manage the text field
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
////////////////////////
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
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(60, 80),
          backgroundColor: note.isNotEmpty && selectedButtonIndex != -1
              ? Theme.of(context).colorScheme.primary
              : Colors.grey, // Change button color to gray if data is incomplete
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: () {
          if (note.isNotEmpty && selectedButtonIndex != -1) {
            _saveDataToFirestore();
            noteController.clear();
          }
        },
        child: const Text(
          "Save",
          style: TextStyle(height: 1, fontSize: 30, color: Colors.white),
        ),
      )

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