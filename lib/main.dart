import 'package:flutter/material.dart';

// I Flutter starter alle widgets med stort forbogstav (det er basically klasser)
// Widgets kan have argumenter som tager endnu en widget som input

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Tilføjer eller fjerner en "debug" ribbon i højre hjørne
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const RootPage(),
  
    ); 
  }
}

class RootPage extends StatefulWidget { // Stateful widget gør at UI kan opdateres når brugeren interagerer med skærmen
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold indeholder app bar, body og navigation bar
    appBar: AppBar(), // App bar er den øverste menu vi kan se i appen

    ); 
  }
}