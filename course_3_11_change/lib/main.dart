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
    return _myListView(context);
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}

Widget _myListView(BuildContext context) {
  final List<ListItem> items = List<ListItem>.generate(
    10000,
    (i) => i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message body $i'),
  );

  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      if (item is HeadingItem) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
          child: Text(
            item.heading,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        );
      } else if (item is MessageItem) {
        return Card(
          color: Colors.blueGrey[800],
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              item.sender,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item.body,
              style: TextStyle(color: Colors.blueGrey[200]),
            ),
            leading: Icon(Icons.insert_photo, color: Colors.cyanAccent),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey[300]),
            onTap: () {},
          ),
        );
      }
      return SizedBox.shrink();
    },
  );
}