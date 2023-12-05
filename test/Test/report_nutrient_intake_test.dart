import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5/report_nutrient_intake.dart';


void main() {
  testWidgets('Report Nutrient Intake Page - Save Data', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ReportNutrientIntakePage(),
      ),
    );

    // Enter valid note
    await tester.enterText(find.byType(TextField), 'Test food');

    // Tap the time selection button
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle();

    // Select a time (e.g., 12:00 PM)
    await tester.tap(find.text('12').at(0));
    await tester.tap(find.text('00').at(0));
    await tester.tap(find.text('PM').at(0));
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
