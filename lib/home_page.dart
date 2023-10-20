import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p5/get_user_name.dart';
import 'package:p5/report_exercise.dart';
import 'package:p5/report_nutrient_intake.dart';
import 'package:p5/services/firestore.dart';
import 'package:p5/test_page.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance
      .currentUser!; // Her siger vi bare at brugeren er den nuværende bruger som er logget ind

  List<String> docIDs = [];

  // get docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference
                  .id); // Vi tilføjer hvert ID til vores array af docIDs
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

  // Text controller (kontrollerer hvad brugeren inputter)

  final TextEditingController textController = TextEditingController();

  // Tilføjer firestore metoder (CRUD)
  final FirestoreService firestoreService = FirestoreService();

  // åben dialog box til at tilføje en user
  void openNewUserBox({String? docID}) { // ? betyder at docID godt kan være null (parametret er ikke påkrævet) --> konceptet hedder null safety
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          TextButton(
              onPressed: () {
                // Add new user
                if (docID == null) {
                  firestoreService.addUser(
                    textController.text, textController.text);
                } 
                // Opdatér fornavnet på en eksisterende bruger
                else {
                  firestoreService.updateUserFirstName(
                    docID, textController.text);
                }


                // Clear text controller
                textController.clear();

                // Close the box
                Navigator.pop(context);
              },
              child: const Text("Add new user"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged in as ${user.email!}"),
        actions: [
          IconButton(
            // Log ud knap --> når der trykkes, logges brugeren ud
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body:
        StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getUsersStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List usersList = snapshot.data!
                      .docs; // ! betyder at kommandoen kun udføres hvis dataen ikke er tom

                  return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      // get hvert individuelt document (bruger)
                      DocumentSnapshot document = usersList[index];
                      String docID = document.id;

                      // get firstName fra hvert dokument
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String firstNameText = data["firstName"];
                      // display som en list tile
                      return ListTile(
                        title: Text(firstNameText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          // Knap til at opdatere brugernavn
                          IconButton( 
                          onPressed: () => openNewUserBox(docID: docID),
                          icon: const Icon(Icons.settings)),

                          IconButton( 
                          onPressed: () => firestoreService.deleteUser(docID),
                          icon: const Icon(Icons.delete)),

                        ],)
                      );
                    },
                  );
                }
                // Hvis der ikke er noget data, skriver vi at der ikke er data
                else {
                  return const Text("No user data found");
                }
              })
      
      //  Column(
      //   children: [
      //     Container(
      //       color: Colors.amber,
      //       margin: const EdgeInsets.fromLTRB(100, 20, 100, 20),
      //       padding: const EdgeInsets.all(50),
      //       height: 250,
      //       width: double.infinity,
      //       child: const Text("Her kommer der en graf"),
      //     ),
      //     const SizedBox(height: 5),
      //     Center(
      //       child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(builder: (BuildContext context) {
      //               return const ReportNutrientIntakePage();
      //             }),
      //           );
      //         },
      //         child: const Text("Report nutrient intake"),
      //       ),
      //     ),
      //     const SizedBox(height: 5),
      //     Center(
      //       child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(builder: (BuildContext context) {
      //               return const ReportExercise();
      //             }),
      //           );
      //         },
      //         child: const Text("Report exercise"),
      //       ),
      //     ),
      //     const SizedBox(height: 5),
      //     Center(
      //       child: ElevatedButton(
      //         onPressed: () {
      //           openNewUserBox();
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(builder: (BuildContext context) {
      //           //     return const TestPage();
      //           //   }),
      //           // );
      //         },
      //         child: const Text("Test Page"),
      //       ),
      //     ),
      //     // Expanded(
      //     //   child: FutureBuilder(
      //     //     // Vi laver en futurebuilder fordi vi først skal vente på at dataen er blevet hentet fra databasen før vi kan lave vores ListTile
      //     //     future: getDocID(),
      //     //     builder: (context, snapshot) {
      //     //       return ListView.builder(
      //     //         itemCount: docIDs.length,
      //     //         itemBuilder: (context, index) {
      //     //           return ListTile(
      //     //             title: GetUserName(docIDs[index]),
      //     //           );
      //     //         },
      //     //       );
      //     //     },
      //     //   ),
      //     // ),
              
      //   ],
      // ),
    );
  }
}
