import 'package:flutter/material.dart';

class ReportNutrientIntakePage extends StatefulWidget {
  const ReportNutrientIntakePage({super.key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}

class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Se min seje app"),
        automaticallyImplyLeading: false, // Fjerner automatisk genereret tilbageknap
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop(); // Tager os tilbage til den forrige side --> pop() betyder at vi fjerner den nuværende side
        }, icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [ // children tillader os at tilføje mere end én widget
          Image.asset("images/einstein.jpg")
        ],
      ),
    );
  }
}
