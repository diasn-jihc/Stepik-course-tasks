import 'package:flutter/material.dart';
import 'package:course_17_3/calculator.dart';
import 'package:course_17_3/operation.dart';
import 'package:course_17_3/operation_widget.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.add,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.substract,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.multiply,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.divide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
