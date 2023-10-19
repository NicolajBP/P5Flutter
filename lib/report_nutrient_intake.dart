import 'package:flutter/material.dart';

class ReportNutrientIntakePage extends StatefulWidget {
  const ReportNutrientIntakePage({super.key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}

class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  bool isSwitched =
      false; // Husk at deklarering af variable skal ske inden vores override og build
  bool? isBoxChecked = false; // bool? betyder nullable bool

   TimeOfDay _time = const TimeOfDay(hour: 8, minute: 15);

    void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P5 CGM app"),
        automaticallyImplyLeading:
            true, // Fjerner automatisk genereret tilbageknap
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Tager os tilbage til den forrige side --> pop() betyder at vi fjerner den nuværende side
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
            IconButton(
              onPressed: () {
              showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
              );
              },
              icon: const Icon(Icons.info_outline)),
        ]
),

body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _selectTime,
              //child: const Text('SELECT TIME'),           
           icon: const Icon(Icons.access_time)),
            const SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
          ],
        ),
      ),
   );

  }

}

  Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Information about portion size',
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("A Small portion is everything below or around 100g \nMedium is around 300g \nLarge is around or over 500g \n\n A small portion could be a apple, a medium could be two pieces of bread with topping and a large portion could be a whole pizza "),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}

