import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text("Building Layouts", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey[900]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.adjust, size: 50, color: Colors.orangeAccent),
              Icon(Icons.adjust, size: 120, color: Colors.tealAccent),
              Icon(Icons.adjust, size: 50, color: Colors.amberAccent),
            ],
          ),
        ),
      ),
    );
  }
}
