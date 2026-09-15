import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(199, 63, 81, 181),
        appBar: AppBar(
          title: const Text("Counter", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tap \"-\" to decrement",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                ComponentCountes(),
                SizedBox(height: 10),
                Text(
                  "Tap \"+\" to increment",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComponentCountes extends StatefulWidget {
  const ComponentCountes({super.key});

  @override
  State<ComponentCountes> createState() => _ComponentCountesState();
}

class _ComponentCountesState extends State<ComponentCountes> {
  int _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 197, 201, 232),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_currentValue > 0) _currentValue -= 1;
                  });
                },
                icon: const Icon(Icons.remove, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "$_currentValue",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentValue += 1;
                  });
                },
                icon: const Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 