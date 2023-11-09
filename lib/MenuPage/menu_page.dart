//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:p5/Homepage/home_page.dart';
import 'package:p5/MenuPage/profile_page.dart';
import 'package:p5/myEntries.dart';
import 'notfications_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(   

        appBar: AppBar(
        title: const Text("Menu"),
        ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
  
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton.icon(               //Profile button
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const ProfilePage();
                  }));
                }, 
                icon: const Icon(
                  Icons.person,
                 // opticalSize: 5.0,
                  color: Colors.white,
                  size: 80,
                ),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  const Column(children: [
                    Text('User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  //textAlign: TextAlign.left,
                ),
                  Text('Edit profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),)
                  ]),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.onPrimary,
                )]
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(600, 100),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  shape:const ContinuousRectangleBorder(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),

          const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(               //notification button
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const NotficationPage();
                  }));
                }, 
                icon: const Icon(
                  Icons.notifications
                ),
                label: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )]
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  minimumSize: const Size(600, 70),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  shape: LinearBorder.bottom(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),

            const SizedBox(height: 10),

           Padding(
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton.icon(               //logout button
                onPressed: () {
                 Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const myEntries();  }),
              );
                }, 
                icon: const Icon(
                  Icons.history
                ),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text(
                  'Previous entries',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )]
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  minimumSize: const Size(600, 70),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  shape: LinearBorder.bottom(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),


            const SizedBox(height: 10),







//////////////////////////////////////////////////logout button//////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton.icon(              
                onPressed: () {
                  signUserOut();
                }, 
                icon: const Icon(
                  Icons.logout
                ),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text(
                  'Log out',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )]
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  minimumSize: const Size(600, 70),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  shape: LinearBorder.bottom(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),
            ],

          )
        ],
      ),
    );
  }
}