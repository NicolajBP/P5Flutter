import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p5/home_page.dart';
import 'package:p5/profile_page.dart';
import 'package:p5/trends.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth.page.dart';

// I Flutter starter alle widgets med stort forbogstav (det er basically klasser)
// Widgets kan have argumenter som tager endnu en widget som input

Key password = const Key("password");

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(key: UniqueKey()), // Provide a unique key
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
      theme: ThemeData(
       useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.light,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  ),
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
     HomePage(),
    const Trends(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold indeholder app bar, body og navigation bar
      appBar: AppBar(
        title: const Text('P5 CGM app'), // Tilføjer tekst til vores AppBar
        actions: const [
        IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.logout),
        ),
      ],
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
