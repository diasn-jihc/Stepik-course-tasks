import 'package:flutter/material.dart';
import 'package:course_16_7/global_key_example_two.dart';

const _appTitle = 'Flutter Demo';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData.dark(),
      home: const GlobalKeyExampleTwo(),
    );
  }
}
