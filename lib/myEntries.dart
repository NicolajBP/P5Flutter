import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Definere navn af vores collection "nutrition_entries"
CollectionReference myCollection = FirebaseFirestore.instance.collection('nutrition_entries');

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
          String titleText = entry['mealSize'] ?? 'Ukendt måltidsstørrelse';
          String noteText = entry['note'] ?? 'Ingen note tilgængelig';
          String timeText = entry['time'] ?? 'Ingen tidspunkt angivet';

          // Opret en mini liste med titel og undertitel
          return ListTile(
            title: Text(titleText),
            subtitle: Text('Note: $noteText, Tidspunkt: $timeText'),
          );
        },
      ),
    );
  }
}
