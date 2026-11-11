import 'package:flutter/material.dart';
import 'package:course_17_4/calculator.dart';
import 'package:course_17_4/operation.dart';
import 'package:course_17_4/operation_widget.dart';
import 'package:course_17_4/fib.dart';
import 'package:course_17_4/power_of_two.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF0B1715), appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)), inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Калькулятор'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Fib(calculator: calculator),
                const Divider(),
                PowerOfTwo(calculator: calculator),
                const Divider(),
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
