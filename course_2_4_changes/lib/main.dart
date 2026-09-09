import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 60,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}