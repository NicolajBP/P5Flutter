import 'package:flutter/material.dart';
import 'package:p5/add_bruger_screen.dart';
import 'package:p5/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) { //Route generator. Hjælper os med at få argument hvis vi skifter mellem arguments.

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage);
      case '/add_bruger':
        return MaterialPageRoute(builder: (_) => const AddBrugerScreen());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){ //Tilføjer routeError
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text('No route'), //Errorcode hvis ingen route er fundet
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Sorry no route was found. :(', style: TextStyle(color: Colors.red, fontSize: 18.0)),
        )
      );
    });
  }
}