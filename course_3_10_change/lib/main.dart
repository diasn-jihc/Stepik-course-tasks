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
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.blueGrey[800],
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 4.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            items[index],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          leading: Icon(Icons.insert_photo, color: Colors.cyanAccent),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey[300]),
          onTap: () {},
        ),
      );
    },
  );
}