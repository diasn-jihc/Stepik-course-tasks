import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(title: Text("MY APP"), centerTitle: true),
        body: Center(
          child: Text(
            "Welcome to My App!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    ),
  );
}
