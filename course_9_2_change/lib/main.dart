import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Оценка',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 0;

  static const List<String> _labels = [
    'Поставьте оценку',
    'Плохо',
    'Нормально',
    'Отлично!',
  ];

  @override
  Widget build(BuildContext context) {
    const double size = 50;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        title: const Text('Оцените приложение'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final int value = index + 1;
                return IconButton(
                  icon: Icon(
                    _rating >= value ? Icons.star : Icons.star_border,
                    size: size,
                  ),
                  color: Colors.amber[700],
                  iconSize: size,
                  onPressed: () {
                    setState(() {
                      _rating = value;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Text(
              _labels[_rating],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.teal[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}