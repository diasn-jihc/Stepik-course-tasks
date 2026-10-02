import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Unix timestamp бойынша датаны түрлендіру
    final rawDate = DateTime.fromMillisecondsSinceEpoch(1485789600 * 1000);
    final dateFormat = DateFormat('EEEE');
    debugPrint('День недели: ${dateFormat.format(rawDate)}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Зависимости и пакеты',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Зависимости и пакеты'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.widgets,
                size: 80,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 16),
              Text(
                'День недели: ${dateFormat.format(rawDate)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
