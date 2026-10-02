import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    final rawDate = DateTime.fromMillisecondsSinceEpoch(1485789600 * 1000);
    final dateFormat = DateFormat('EEEE');
    debugPrint(dateFormat.format(rawDate));

    return MaterialApp(
      title: 'Dependencies',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependencies & Package'),
          centerTitle: true,
        ),
      ),
    );
  }
}
