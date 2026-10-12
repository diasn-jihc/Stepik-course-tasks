import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y', 'ru').format(dateTime);
  }

  static Widget getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: const Color(0xFF0D9488),
          size: 28.0,
        ),
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          units,
          style: const TextStyle(
            fontSize: 13.0,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}