import 'package:flutter/material.dart';
import 'package:course_5_6/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(text, style: const TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              child: const Text(
                'Go to second screen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _returnDataFromSecondScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _returnDataFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );

    if (!mounted || result == null) return;
    setState(() {
      text = result;
    });
  }
}
