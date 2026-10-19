import 'package:flutter/material.dart';
import 'package:course_11_3/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data!.list;
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
    forecastList[index].dt * 1000,
  );
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$tempMin °C',
              style: const TextStyle(fontSize: 28.0, color: Colors.white),
            ),
          ),
          Image.network(icon, scale: 1.2),
        ],
      ),
    ],
  );
}
