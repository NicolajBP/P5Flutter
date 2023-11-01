import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isSwitched =
      false; // Husk at deklarering af variable skal ske inden vores override og build
  bool? isBoxChecked = false; // bool? betyder nullable bool

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.teal,
              )
                ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton.icon(               //logout button
                onPressed: () {
                }, 
                icon: const Icon(
                  Icons.logout
                ),
                label: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  minimumSize: const Size(600, 70),
                  shape: LinearBorder.bottom()
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton.icon(
                onPressed: () {
                }, 
                icon: const Icon(
                  Icons.notifications
                ),
                label: const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25
                  ),
                  textAlign: TextAlign.left,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  minimumSize: const Size(600, 70),
                  shape: LinearBorder.bottom(),
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