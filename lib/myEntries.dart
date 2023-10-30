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
      body: Center(
        child: Text("der kommer noget her"),
      ),
    );
  }
}
