import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        title: Text("P5 CGM app"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text("der kommer noget her"),
      ),
    );
  }
}
