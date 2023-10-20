import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/get_user_name.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;  // Her siger vi bare at brugeren er den nuværende bruger som er logget ind

FirebaseFirestore db = FirebaseFirestore.instance;



 List<String> docIDs = [];

  // get docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id); // Vi tilføjer hvert ID til vores array af docIDs
          },
          ),
        ); // Giver os  brugernes data
  }

//sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut(); // Laver en metode til at logge ud
  }

  // @override
  // void initState() {
  //   getDocID();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged in as " + user.email!),
        actions: [
          IconButton(
            // Log ud knap --> når der trykkes, logges brugeren ud
            onPressed: 
              () => FirebaseAuth.instance.signOut()
            ,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            margin: const EdgeInsets.fromLTRB(100, 20, 100, 20),
            padding: const EdgeInsets.all(50),
            height: 250,
            width: double.infinity,
            child: const Text("Her kommer der en graf"),
          ),
          const SizedBox(height: 5),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const ReportNutrientIntakePage();
                  }),
                );
              },
              child: const Text("Report nutrient intake"),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const ReportExercise();
                  }),
                );
              },
              child: const Text("Report exercise"),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const TestPage();
                  }),
                );
              },
              child: const Text("Test Page"),
            ),
          ),
          // Expanded(
          //   child: FutureBuilder(
          //     // Vi laver en futurebuilder fordi vi først skal vente på at dataen er blevet hentet fra databasen før vi kan lave vores ListTile
          //     future: getDocID(),
          //     builder: (context, snapshot) {
          //       return ListView.builder(
          //         itemCount: docIDs.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: GetUserName(documentId: docIDs[index]),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
