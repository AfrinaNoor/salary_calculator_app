import 'package:flutter/material.dart';
import 'salary_formula.dart'; // Import the utility file

void main() {
  runApp(SalaryCalculatorApp());
}

class SalaryCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SalaryCalculatorScreen(),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController hoursController = TextEditingController();
  double calculatedSalary = 0;

  void handleCalculate() {
    final hours = int.tryParse(hoursController.text);
    if (hours == null || hours < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid number of hours')),
      );
      return;
    }
    setState(() {
      calculatedSalary = calculateSalary(hours); // Use the utility function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Working Hours',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: handleCalculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Calculated Salary: Tk $calculatedSalary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
