import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5/report_nutrient_intake.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //initialisere firebase til test, det er vigtig at gøre det for den initialesering i main fungere ikke her
  testWidgets('Report Nutrient Intake Page - Save Data', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
         home: ReportNutrientIntakePage(),
       ),
     );

    // Enter valid note
    tester.enterText(find.byType(TextField), 'Test food');

    // Tap the time selection button
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle();

    // Select a time (e.g., 12:00 PM)
    await tester.tap(find.text('12').at(0));
    await tester.tap(find.text('00').at(0));
    //await tester.tap(find.text('PM').at(0));
    await tester.tap(find.text('OK').at(0));
    await tester.pumpAndSettle();

    // Select a meal size (e.g., Medium)
    await tester.tap(find.text('Medium'));
    await tester.pumpAndSettle();

    // Tap the Save button
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Check if the data is saved successfully
    expect(find.text('Data is saved successfully.'), findsOneWidget);
  });
}
