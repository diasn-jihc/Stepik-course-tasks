import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Учебное приложение',
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF0B1715), appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)), inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      ColorWidget(key: UniqueKey()),
      ColorWidget(key: UniqueKey()),
    ];
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уникальный ключ'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz, size: 32),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  ColorWidget({super.key}) : myColor = GenerateColor.getColor();

  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: myColor,
    );
  }
}

class GenerateColor {
  static final Random _random = Random();
  static const List<Color> _palette = [
    Color(0xFF168B7E),
    Color(0xFF245F58),
    Color(0xFF347F91),
    Color(0xFF9B7742),
  ];

  static Color getColor() {
    return _palette[_random.nextInt(_palette.length)];
  }
}
