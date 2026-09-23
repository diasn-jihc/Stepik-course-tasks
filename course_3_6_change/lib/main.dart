import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Building Layouts", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.network(
                'https://picsum.photos/400/600',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.deepPurple,
                alignment: Alignment.center,
                child: Text('1', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text('2', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text('3', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
