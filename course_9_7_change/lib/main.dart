import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class ColorProvider extends ChangeNotifier {
  bool _isSwitched = false;
  Color _currentColor = Colors.teal;

  bool get isSwitched => _isSwitched;
  Color get currentColor => _currentColor;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    _currentColor = Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorProvider(),
      child: const MaterialApp(
        title: 'Смена цвета',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: const Text('Смена цвета через Provider'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 180,
              height: 180,
              color: colorProvider.currentColor,
            ),
            const SizedBox(height: 30),
            Switch(
              value: colorProvider.isSwitched,
              activeColor: Colors.deepOrange,
              onChanged: (value) {
                colorProvider.toggleSwitch(value);
              },
            ),
            Text(
              'Переключите, чтобы сменить цвет',
              style: TextStyle(color: Colors.teal.shade900, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}