import 'package:flutter/material.dart';
import 'package:p5/profile_page.dart';
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
        automaticallyImplyLeading: true, //tilbageknap i appbar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
                label: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Column(children: [
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
                  color: Colors.black,
                )]
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(600, 100),
                  side: const BorderSide(color: Colors.teal),
                  shape:const ContinuousRectangleBorder(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),

          const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton.icon(               //logout button
                onPressed: () {
                }, 
                icon: const Icon(
                  Icons.logout
                ),
                label: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text(
                  'Log out',
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
                  side: const BorderSide(color: Colors.teal),
                  shape: LinearBorder.bottom(),
                  alignment: Alignment.centerLeft,
                  )
              ),
            ),
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
                  side: const BorderSide(color: Colors.teal),
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