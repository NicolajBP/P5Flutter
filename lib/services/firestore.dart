import 'dart:js_interop_unsafe';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  
  final CollectionReference users = FirebaseFirestore.instance.collection("users"); // Her siger vi at users af datatypen CollectionReference er lig "users" vores instans af databasen

  // CREATE: add a new note
  Future<void> addUser(String firstName, String lastName) {
    return users.add({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getUsersStream() { // "Lytter efter ændringer i vores database"
    final usersStream = users.orderBy("firstName", descending: true).snapshots();
  
    return usersStream;
  
  } 


  // UPDATE

  Future<void> updateUserFirstName(String docID, String newFirstName) {
    return users.doc(docID).update({
      "firstName": newFirstName
  
  
  });

  }

  // DELETE users
   Future<void> deleteUser(String docID) {
    return users.doc(docID).delete();
   }




}