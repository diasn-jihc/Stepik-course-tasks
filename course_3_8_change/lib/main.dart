import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text('Weather', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _weatherDescription(),
                Divider(color: Colors.blueGrey[700]),
                _temperature(),
                Divider(color: Colors.blueGrey[700]),
                _temperatureForecast(),
                Divider(color: Colors.blueGrey[700]),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _headerImage() {
  return Image.network(
    'https://picsum.photos/800/400',
    fit: BoxFit.cover,
    height: 200,
    width: double.infinity,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pulvinar purus nec nulla condimentum egestas eu sed nulla.',
        style: TextStyle(color: Colors.blueGrey[200]),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.wb_sunny, color: Colors.amber, size: 50),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '15° Clear',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Murmanskaya oblast, Murmansk',
            style: TextStyle(color: Colors.blueGrey[300]),
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    runSpacing: 8.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
        avatar: Icon(Icons.wb_cloudy, color: Colors.cyanAccent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.cyanAccent.withOpacity(0.5)),
        ),
        backgroundColor: Colors.blueGrey[800],
      );
    }),
  );
}

Widget _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, size: 18.0, color: Colors.amber),
      Icon(Icons.star, size: 18.0, color: Colors.amber),
      Icon(Icons.star, size: 18.0, color: Colors.amber),
      Icon(Icons.star, size: 18.0, color: Colors.grey),
      Icon(Icons.star, size: 18.0, color: Colors.grey),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 14.0, color: Colors.blueGrey[200]),
      ),
      stars,
    ],
  );
}