import 'package:flutter_test/flutter_test.dart';
import 'package:salary_calculator_app/salary_formula.dart'; // Import the utility file

void main() {
  group('Salary Calculation', () {
    test('Calculate salary for 35 hours', () {
      final salary = calculateSalary(35);
      expect(salary, 14000.0); // 35 * 400
    });

    test('Calculate salary for 45 hours', () {
      final salary = calculateSalary(45);
      expect(salary, 19000.0); // (40 * 400) + (5 * 600)
    });

    test('Calculate salary for 0 hours', () {
      final salary = calculateSalary(0);
      expect(salary, 0.0);
    });

    test('Calculate salary for negative hours (invalid case)', () {
      final salary = calculateSalary(-5);
      expect(salary, 0.0); // You can define your behavior for invalid cases
    });
  });
}
