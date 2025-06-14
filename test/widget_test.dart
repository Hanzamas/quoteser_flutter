// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quoteser_flutter/main.dart';

void main() {
  testWidgets('Quotes app displays quote and buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app shows the title
    expect(find.text('Quotes of the Day'), findsOneWidget);
    
    // Verify that there are quote navigation buttons
    expect(find.text('Berikutnya'), findsOneWidget);
    expect(find.text('Acak'), findsOneWidget);

    // Verify that a quote is displayed (check for quote icon)
    expect(find.byIcon(Icons.format_quote), findsOneWidget);

    // Tap the 'Berikutnya' button and trigger a frame.
    await tester.tap(find.text('Berikutnya'));
    await tester.pump();

    // Verify that the app still shows quotes elements after button press
    expect(find.text('Berikutnya'), findsOneWidget);
    expect(find.text('Acak'), findsOneWidget);
  });
}
