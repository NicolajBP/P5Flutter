import 'package:flutter/material.dart';
import 'package:p5/home_page.dart';
import 'package:p5/login_page.dart';
import 'package:p5/profile_page.dart';
import 'package:p5/trends.dart';
import "package:drift/native.dart";
import "data.dart";


// I Flutter starter alle widgets med stort forbogstav (det er basically klasser)
// Widgets kan have argumenter som tager endnu en widget som input

Key password = const Key("password");

Future<void> main() async {

  final db = Database(NativeDatabase.memory()); // Her siger vi at vores database db er lig klassen "Database" fra data.dart

  final id = await db.into(db.products).insert(ProductsCompanion.insert(
    title: "Flutter Drift", 
    description: "Drift Database")); //DatabaseCompanion tillader os at indsætte data i vores database. Den spørger kun og title og description da "id" bruger metoden autoIncrement() og derfor deklareres automatisk

  await db.into(db.details).insert(DetailsCompanion.insert(name: "Database name", productId: id));

  await db.into(db.products).insert(ProductsCompanion.insert(
    title: "FTutorial on Database", 
    description: "Tutorial on Database")); 
  // ignore: avoid_print
  (await db.select(db.products).get()).forEach(print); // Vi finder db.products i data.g.dart --> databasen er blevet genereret her. Linjen printer hvad der står i databasen
  (await db.select(db.details).get()).forEach(print);
  (await db.select(db.productsView).get()).forEach(print); // Printer en kombination af info fra details og products, da de nu er blevet joinet

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(key: UniqueKey()), // Provide a unique key
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Tilføjer eller fjerner en "debug" ribbon i højre hjørne
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  // Stateful widget gør at UI kan opdateres når brugeren interagerer med skærmen
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [
    // LoginPage(key: password),
    const HomePage(),
    const Trends(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold indeholder app bar, body og navigation bar
      appBar: AppBar(
        title: const Text('P5 CGM app0'), // Tilføjer tekst til vores AppBar
      ), // App bar er den øverste menu vi kan se i appen
      body: pages[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint("Floating Action Button");
      //   },
      //   child: const Icon(Icons.add), // Laver knappen i nederste højre hjørne
      // ), // onPressed fortæller appen hvad der skal ske når man trykker på
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.line_axis), label: "Trends"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
