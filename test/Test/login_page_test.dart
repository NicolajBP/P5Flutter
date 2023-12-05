import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5/Login/login_page.dart';
import 'package:p5/main.dart';

void main() {
  setUpAll(() async {
    // Initialize Firebase once before running the tests
    await Firebase.initializeApp();
  });

  testWidgets('Login Page - Successful Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(onTap: null),
      ),
    );

    // Enter valid username and password
    await tester.enterText(find.byType(TextField).at(0), 'p5@aau.dk');
    await tester.enterText(find.byType(TextField).at(1), '123456');

    // Tap the login button
    await tester.tap(find.text('Login'));

    // Ensure that the authentication process is completed before proceeding
    await tester.pumpAndSettle(Duration(seconds: 30));

    // Check if the app navigated to the expected screen after successful login
    expect(find.byType(MyApp), findsOneWidget);
  });

  testWidgets('Login Page - Unsuccessful Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(onTap: null),
      ),
    );

    // Enter invalid username and password
    await tester.enterText(find.byType(TextField).at(0), 'invalid@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'invalidpassword');

    // Tap the login button
    await tester.tap(find.text('Login'));

    // Ensure that the authentication process is completed before proceeding
    await tester.pumpAndSettle(Duration(seconds: 5));

    // Check if the error message is displayed
    expect(find.text('Invalid username or password'), findsOneWidget);
  });
}
