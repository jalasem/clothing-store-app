// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_demo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(
        find.text(
            'Connect with a community of experienced designers. Take your design career to the next level.'),
        findsOneWidget);
    expect(find.text('Uplift & Grow Together'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Sign up to get notified!'), findsNothing);
    expect(find.text('Uplift & Grow Together'), findsNothing);
  });
}
