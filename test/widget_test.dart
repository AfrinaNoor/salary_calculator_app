import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salary_calculator_app/main.dart'; // Adjust the import to your main.dart file path

void main() {
  testWidgets('Salary calculation increments correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SalaryCalculatorApp());

    // Verify that the initial calculated salary is 0.
    expect(find.text('Calculated Salary: Tk 0.0'), findsOneWidget);

    // Find the TextField and enter a valid number of hours (e.g., 40).
    await tester.enterText(find.byType(TextField), '40');
    await tester.pump(); // Trigger a frame after entering text.

    // Tap the 'Calculate' button to calculate the salary.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Rebuild the widget after the button is tapped.

    // Verify that the salary calculated is correct (40 * 400 = 16000).
    expect(find.text('Calculated Salary: Tk 16000.0'), findsOneWidget);

    // Now, test an invalid input (negative hours).
    await tester.enterText(find.byType(TextField), '-5');
    await tester.pump(); // Trigger a frame after entering text.

    // Tap the 'Calculate' button again with invalid input.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Rebuild the widget.

    // Verify that the error message is displayed for invalid input.
    expect(find.text('Please enter a valid number of hours'), findsOneWidget);
  });
}
