import 'package:flutter/material.dart';
import 'package:course_17_4/calculator.dart';

class Fib extends StatelessWidget {
  final Calculator calculator;

  const Fib({super.key, required this.calculator});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: calculator.fibonacciSequence(),
      initialData: null,
      builder: ((context, snapshot) {
        final result = snapshot.data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result != null ? 'Числа Фибоначчи: $result' : 'Вычисляем...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        );
      }),
    );
  }
}
