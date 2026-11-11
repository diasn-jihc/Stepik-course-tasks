import 'dart:math';
import 'package:flutter/material.dart';
import 'user.dart';

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    super.key,
    required this.user,
  });

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  static const List<Color> _palette = [
    Color(0xFF168B7E),
    Color(0xFF245F58),
    Color(0xFF347F91),
    Color(0xFF9B7742),
  ];
  late Color color;

  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();
    return _palette[random.nextInt(_palette.length)];
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(widget.user.name, style: const TextStyle(fontSize: 20)),
          subtitle: Text(widget.user.country, style: const TextStyle(fontSize: 20)),
          trailing: Text('Хеш-код: ${widget.user.hashCode}', style: const TextStyle(fontSize: 18)),
        ),
      );
}
