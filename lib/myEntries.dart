import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p5/register_page.dart';

// Definere navn af vores collection "nutrition_entries"

Future<DocumentSnapshot> getNestedDocument(String userId, String documentId) async {
  // Reference to the top-level collection
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  
  // Reference to the user's document
  DocumentReference userDocument = usersCollection.doc(userId);
  
  // Reference to the nested collection
  CollectionReference documentsCollection = userDocument.collection("patientData");
  
  // Retrieve the specific nested document
  DocumentSnapshot documentSnapshot = await documentsCollection.doc(documentId).get();
  
  return documentSnapshot;
}

final user = FirebaseAuth.instance.currentUser!;

String userId = user.uid; // Replace with the actual user ID
String documentId = dateYYYY_MM_DD; // Replace with the actual document ID

getNestedDocument(userId, documentId)
.then((DocumentSnapshot documentSnapshot) {
  if (documentSnapshot.exists) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    // Use the data from the document as needed
    print(data);
  } else {
    print('Document does not exist');
  }
}).catchError((error) {
  print('Error getting document: $error');
});

// ignore: camel_case_types
class myEntries extends StatefulWidget {
  const myEntries({super.key});

  @override
  State<myEntries> createState() => _myEntriesState();
}

class _myEntriesState extends State<myEntries> {
  // En liste til at gemme dataene fra vores database
  List<Map<String, dynamic>> entriesData = [];

  @override
  void initState() {
    super.initState();
    getEntries();
  }

  // Funktion til at få data fra Firestore
  Future<void> getEntries() async {
    // Her laver den en querysnapshot som er en øjeblikkelige query
    QuerySnapshot querySnapshot = await myCollection.get();

    // Opret en liste til at gemme de hentede data
    List<Map<String, dynamic>> data = [];

   
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic>? entryData = doc.data() as Map<String, dynamic>?;

      if (entryData != null) {
        data.add(entryData);
      }
    }

    // Opdater state med de hentede data
    setState(() {
      entriesData = data;
    });
  }

  // funktion til sletning af en entry
  Future<void> deleteEntry(String entryId) async {
    await myCollection.doc(entryId).delete();
    getEntries(); // Refresh the list after deletion
  }

  // Function to navigate to the edit screen
  void editEntry(Map<String, dynamic> entry) {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous Entries"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: entriesData.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> entry = entriesData[index];

          // Hent værdierne for Mealsize, note og tidspunkt fra Firestore-dataene eller skriver ingen data fundet når null-værdier er fundet.
          String titleText = entry['meal_size'] ?? 'Unknown Size';
          print('Meal Size: $titleText');
          String noteText = entry['note'] ?? '';
          String timeText = entry['time'] ?? '';

          // Opret en mini liste med titel og undertitel
          return ListTile(
            title: Text(titleText),
            subtitle: Text('Note: $noteText, Time: $timeText'),
          );
        },
      ),
    );
  }
}
