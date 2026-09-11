import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Building layouts"),
          centerTitle: true,
        ), // AppBar
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(),
          ), // BoxDecoration
          width: 200,
          height: 100,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Text(
            'Hello flutter!',
            style: TextStyle(fontSize: 30),
          ), // Text
        ), // Container
      ), // Scaffold
    ); // MaterialApp
  }
}