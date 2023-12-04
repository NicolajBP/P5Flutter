// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/Login/register_page.dart';

class ReportNutrientIntakePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ReportNutrientIntakePage({Key? key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}

class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  // Firestore instance til at interegerer med databasen.

  bool isSwitched = false;
  bool? isBoxChecked = false;

  String mealSize = "";
  String note = "";
  String time = "";
  String formattedTime = "";
  //definere input varibler som strings
  TimeOfDay _time = TimeOfDay.now(); //Sætter tiden til den nuværende
  

  final TextEditingController noteController = TextEditingController();

  // Tids valg metode
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;

      // Format the time in ISO 8601 format
      time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        newTime.hour,
        newTime.minute,
      ).toIso8601String();
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
    // ignore: unused_local_variable
    var collection = FirebaseFirestore.instance.collection("users");

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
      time = formattedTime = DateTime.now().toIso8601String();
    }
   // Format the time in "yyyy-MM-ddTHH:mm:ss" format
  
  Map<String, dynamic> entryData = {
    'nutrientSize': mealSize,
    'nutrientNote': note,
    'nutrientTimeStamp': time, // Store the time in ISO 8601 format
  };
    
    



    try {
      // Gem data i Firestore-databasen
      await firestore
          .collection('users')
          .doc(user.uid)
          .collection("patientData")
          .doc(dateYYYY_MM_DD)
          .update({
            "nutrientEntries": FieldValue.arrayUnion([entryData])
          })
          // ignore: avoid_print
          .then((_) => print("Added"))
          // ignore: avoid_print
          .catchError((error) => print("Add failed: $error"));

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data is saved successfully.'),
          duration: Duration(seconds: 3), // Ændre længden af display
        ),
      );

      debugPrint("The data is saved to Firestore.");

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Entry is saved successfully.'),
          duration: Duration(seconds: 3), // Ændre længden af display
        ),
      );
      // Nulstil formularen efter at dataen er blevet gemt
      setState(() {
        selectedButtonIndex = -1;
        note = ""; // Clear the note text field
        time = "";
      });
    } catch (e) {
      debugPrint("Error saving to Firestoe $e");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error saving the entry, try again.'),
          duration: Duration(seconds: 3), // Ændre længden af display
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    noteController.text =
        note; // Initialize the controller with the current value of 'note'
  }

  @override
  void dispose() {
    //sletter alt det bliver skrevet i note boks når data er gemt.
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //"kroppen" af siden
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
  child: Text(
    "Register nutrient intake",
    style: TextStyle(fontSize: 19), // Set the desired font size here
  ),
),
        automaticallyImplyLeading: true, //tilbageknap i appbar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      
        actions: [
          IconButton(
            //informationsknap i appbar
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
              padding: const EdgeInsets.only(top: 100.0, bottom: 120),
              child: SizedBox(
                width: 310,
                height: 160,

                child:
                    ////////////////TextBox/////////////////////
                    TextField(
  controller: noteController,
  decoration: InputDecoration(
    filled: true,
    fillColor: Theme.of(context).colorScheme.primary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    hintText: 'Type of food',
    hintStyle: TextStyle(color: Colors.white),
  ),
  style: TextStyle(color: Colors.white),
  maxLines: 5,
  onChanged: (value) {
    setState(() {
      note = value;
    });
  },
)
////////////////////////
              ),
            ),

           Padding(
  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
  child: OutlinedButton.icon(
    onPressed: _selectTime,
    icon: const Icon(
      Icons.access_time,
      size: 50.0,
    ),
    // ignore: prefer_interpolation_to_compose_strings
    label: Text('${_time.hour}'.padLeft(2,'0') + ':'+'${_time.minute}'.padLeft(2,'0'),
        style: const TextStyle(height: 1, fontSize: 36)),
  ),
),

            const Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    //Overskrift til de tre meal sizes
                    "   Choose your meal size:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0.5,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                ElevatedButton(
                  // Small button
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 30),
                    backgroundColor: selectedButtonIndex == 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                  child: Text(
                    "Small",
                    style: TextStyle(
                        height: 1,
                        fontSize: 20,
                        color: selectedButtonIndex == 0
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary),
                  ),
                ),

                const SizedBox(width: 7),

/////////////////////////////////////////////////////////////////////////////////////////////////////
                ElevatedButton(
                  // Medium button
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 30),
                    backgroundColor: selectedButtonIndex == 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                  child: Text(
                    "Medium",
                    style: TextStyle(
                        height: 1,
                        fontSize: 20,
                        color: selectedButtonIndex == 1
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary),
                  ),
                ),

                const SizedBox(width: 7),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ElevatedButton(
                  // Large button
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40,30),
                    backgroundColor: selectedButtonIndex == 2
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                  child: Text(
                    "Large",
                    style: TextStyle(
                        height: 1,
                        fontSize: 20,
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
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 60),
                    backgroundColor: note.isNotEmpty &&
                            selectedButtonIndex != -1
                        ? Theme.of(context).colorScheme.primary
                        : Colors
                            .grey, // Change button color to gray if data is incomplete
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 11),
                  ),
                  onPressed: () {
                    if (note.isNotEmpty && selectedButtonIndex != -1) {
                      _saveDataToFirestore();
                      noteController.clear();
                    }
                  },
                  child: const Text(
                    "Save",
                    style:
                        TextStyle(height: 1, fontSize: 30, color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  //Widget til popup informations knap
  return AlertDialog(
    title: const Text(
      'Information about portion sizes',
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
