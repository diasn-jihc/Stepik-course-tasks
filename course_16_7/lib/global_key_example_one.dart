import 'package:flutter/material.dart';
import 'helper.dart';

final counterKey = GlobalKey<_CounterWidgetState>();

class GlobalKeyExampleOne extends StatelessWidget {
  const GlobalKeyExampleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalKey Example 1'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterWidget(
              key: counterKey,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
              ),
              onPressed: () {
                final counter = counterKey.currentState?.counter;

                counterKey.currentState?.add();
                final newCounter = counterKey.currentState?.counter;

                Utils.showSnackBar(context,
                    text: 'Counter: $counter -> $newCounter');
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  void add() => setState(() => counter += 10);

  @override
  Widget build(BuildContext context) {
    return Text('$counter', style: const TextStyle(fontSize: 32));
  }
}
