import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Text('Weather Forecast'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
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
        _searchCity(),
        SizedBox(height: 10.0),
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

Row _searchCity() {
  return Row(
    children: <Widget>[
      SizedBox(width: 16.0),
      Icon(Icons.search, color: Colors.white),
      SizedBox(width: 10.0),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white70, fontSize: 16.0),
      ),
    ],
  );
}

Column _cityDetail() {
  return Column(
    children: <Widget>[
      Text(
        'Murmansk Oblast, RU',
        style: TextStyle(fontSize: 30.0, color: Colors.white),
      ),
      SizedBox(height: 6.0),
      Text(
        'Friday, Mar 20, 2020',
        style: TextStyle(color: Colors.white70, fontSize: 16.0),
      ),
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.wb_sunny, size: 70.0, color: Colors.white),
      SizedBox(width: 20.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('14 °F', style: TextStyle(fontSize: 45.0, color: Colors.white)),
          Text('LIGHT SNOW', style: TextStyle(color: Colors.white70)),
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
          Icon(Icons.ac_unit, color: Colors.white),
          Text('5', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text(
            'km/hr',
            style: TextStyle(color: Colors.white70, fontSize: 12.0),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.ac_unit, color: Colors.white),
          Text('3', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text('%', style: TextStyle(color: Colors.white70, fontSize: 12.0)),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(Icons.ac_unit, color: Colors.white),
          Text('20', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Text('%', style: TextStyle(color: Colors.white70, fontSize: 12.0)),
        ],
      ),
    ],
  );
}

Text _forecastTitle() {
  return Text(
    '7-DAY WEATHER FORECAST',
    style: TextStyle(color: Colors.white70, fontSize: 16.0),
  );
}

SizedBox _forecast7Days() {
  return SizedBox(
    height: 100.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _forecastCard('Friday', '6 °F'),
        _forecastCard('Saturday', '5 °F'),
        _forecastCard('Sunday', '22 °F'),
        _forecastCard('Monday', '24 °F'),
        _forecastCard('Tuesday', '28 °F'),
        _forecastCard('Wednesday', '30 °F'),
        _forecastCard('Thursday', '25 °F'),
      ],
    ),
  );
}

Container _forecastCard(String day, String temp) {
  return Container(
    width: 130.0,
    margin: EdgeInsets.all(6.0),
    color: Colors.white24,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(day, style: TextStyle(color: Colors.white, fontSize: 18.0)),
        SizedBox(height: 6.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(temp, style: TextStyle(color: Colors.white, fontSize: 20.0)),
            SizedBox(width: 6.0),
            Icon(Icons.wb_sunny, color: Colors.white),
          ],
        ),
      ],
    ),
  );
}
