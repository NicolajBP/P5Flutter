import'package:flutter/material.dart';
import 'package:p5/screens/home/home_page.dart';

class Wrapper extends StatelessWidget {
//  const Wrapper({super.key}); //Min tilføjer denne, men det er ikke nødvendigt.

  @override
  Widget build(BuildContext context) {
    //Returnerer enten Homepage eller Authenticate widget.
    return HomePage();
  }
}