import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text('Building List View', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(12.0),
    reverse: true,
    children: <Widget>[
      Card(
        color: Colors.blueGrey[800],
        margin: EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          title: Text('Sun', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text('Today Clear', style: TextStyle(color: Colors.blueGrey[200])),
          leading: Icon(Icons.wb_sunny, color: Colors.amber, size: 30),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.cyanAccent),
          onTap: () {},
        ),
      ),
      Card(
        color: Colors.blueGrey[800],
        margin: EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          title: Text('Cloudy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text('Today Cloudy', style: TextStyle(color: Colors.blueGrey[200])),
          leading: Icon(Icons.wb_cloudy, color: Colors.lightBlueAccent, size: 30),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.cyanAccent),
          onTap: () {},
        ),
      ),
      Card(
        color: Colors.blueGrey[800],
        margin: EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          title: Text('Snow', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text('Today Snow', style: TextStyle(color: Colors.blueGrey[200])),
          leading: Icon(Icons.ac_unit, color: Colors.cyan, size: 30),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.cyanAccent),
          onTap: () {},
        ),
      ),
    ],
  );
}