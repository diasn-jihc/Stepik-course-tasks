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
          title: Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
          elevation: 0.0,
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
        SizedBox(height: 10.0),
        _searchCity(),
        SizedBox(height: 15.0),
        _cityDetail(),
        SizedBox(height: 20.0),
        _temperatureDetail(),
        SizedBox(height: 20.0),
        _extraDetail(),
        SizedBox(height: 30.0),
        _forecastTitle(),
        SizedBox(height: 10.0),
        _forecast7Days(),
      ],
    ),
  );
}

Padding _searchCity() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.cyanAccent),
          SizedBox(width: 10.0),
          Text(
            'Taraz',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}

Column _cityDetail() {
  return Column(
    children: <Widget>[
      Text(
        'Zhambyl Region, KZ',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 6.0),
      Text(
        'Wednesday, Sep 16, 2026',
        style: TextStyle(color: Colors.cyanAccent, fontSize: 16.0),
      ),
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.wb_sunny, size: 70.0, color: Colors.amber),
      SizedBox(width: 20.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '26 °C',
            style: TextStyle(
              fontSize: 45.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'CLEAR SKY',
            style: TextStyle(
              color: Colors.blueGrey[200],
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    ],
  );
}

Row _extraDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(Icons.air, color: Colors.cyanAccent),
          SizedBox(height: 4.0),
          Text('12', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text(
            'km/h',
            style: TextStyle(color: Colors.blueGrey[200], fontSize: 12.0),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.water_drop, color: Colors.cyanAccent),
          SizedBox(height: 4.0),
          Text('35', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text(
            '%',
            style: TextStyle(color: Colors.blueGrey[200], fontSize: 12.0),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.compress, color: Colors.cyanAccent),
          SizedBox(height: 4.0),
          Text('1015', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text(
            'hPa',
            style: TextStyle(color: Colors.blueGrey[200], fontSize: 12.0),
          ),
        ],
      ),
    ],
  );
}

Text _forecastTitle() {
  return Text(
    '7-DAY WEATHER FORECAST',
    style: TextStyle(
      color: Colors.blueGrey[200],
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.1,
    ),
  );
}

SizedBox _forecast7Days() {
  return SizedBox(
    height: 110.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: <Widget>[
        _forecastCard('Wednesday', '26 °C'),
        _forecastCard('Thursday', '25 °C'),
        _forecastCard('Friday', '24 °C'),
        _forecastCard('Saturday', '22 °C'),
        _forecastCard('Sunday', '21 °C'),
        _forecastCard('Monday', '23 °C'),
        _forecastCard('Tuesday', '25 °C'),
      ],
    ),
  );
}

Container _forecastCard(String day, String temp) {
  return Container(
    width: 130.0,
    margin: EdgeInsets.all(6.0),
    decoration: BoxDecoration(
      color: Colors.blueGrey[800],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          day,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        SizedBox(height: 6.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              temp,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 6.0),
            Icon(Icons.wb_sunny, color: Colors.amber, size: 20),
          ],
        ),
      ],
    ),
  );
}
