import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BlackOpsOne',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Car Service & Log'),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/new.jpg',
                fit: BoxFit.cover,
              ),
              Center(
                child: Image.asset(
                  'assets/icons/icon.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Text(
                  'Car service',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BlackOpsOne',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}