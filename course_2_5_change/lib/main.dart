import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Text(
          "Welcome to Flutter",
          style: TextStyle(fontSize: 30, color: Colors.blue),
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  );
}
