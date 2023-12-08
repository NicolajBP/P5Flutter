// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Function to construct the collection path based on the user ID
String getCollectionPath(String userId) {
  return '/users/$userId/patientData/2023-12-06/nutrientEntries';
}

class MyEntriesPage  extends StatefulWidget {
  final String userId;

  const MyEntriesPage ({Key? key, required this.userId}) : super(key: key);

  @override
  State<MyEntriesPage > createState() => _MyEntriesState();
}

class _MyEntriesState extends State<MyEntriesPage > {
  // Use a getter to dynamically get the collection reference
  CollectionReference get myCollection =>
      FirebaseFirestore.instance.collection(getCollectionPath(widget.userId));

  // En liste til at gemme dataene fra vores database
  List<Map<String, dynamic>> entriesData = [];

  @override
  void initState() {
    super.initState();
    getEntries();
  }

  Future<void> getEntries() async {
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

  Future<void> deleteEntry(String entryId) async {
    await myCollection.doc(entryId).delete();
    getEntries(); // Refresh the list after deletion
  }

  // Function to navigate to the edit screen
  void editEntry(Map<String, dynamic> entry) {
    // Implement your logic for editing entries
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
          String titleText = entry['Note'] ?? 'Unknown Size';
          print('Note: $titleText');
          String noteText = entry['Meal Size'] ?? '';
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
