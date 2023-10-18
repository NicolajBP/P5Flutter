import 'package:flutter/material.dart';
import 'package:p5/home_page.dart';
import 'package:p5/login_page.dart';
import 'package:p5/profile_page.dart';
import 'package:p5/trends.dart';

// I Flutter starter alle widgets med stort forbogstav (det er basically klasser)
// Widgets kan have argumenter som tager endnu en widget som input

Key password = const Key("password");

void main() {
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
      theme: ThemeData(primarySwatch: Colors.red),
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
        title: const Text('P5 CGM app'), // Tilføjer tekst til vores AppBar
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
