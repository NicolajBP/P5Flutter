import 'package:flutter/material.dart';
import 'package:p5/report_nutrient_intake.dart'; // Vi skal altid have den her import (giver adgang til alle widgets)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton( 
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){ // Bruges som "router" --> vi føres fra denne side til en anden side (i det her tilfælde vores ReportNutrientIntakePage)
            return const ReportNutrientIntakePage();
            })
          );
        },
        child: const Text("Report nutrient intake"),
      ),
    );
  }
}
