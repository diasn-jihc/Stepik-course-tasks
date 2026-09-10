import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
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
          title: Text("Counter", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,

          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tap \"-\" to decrement",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                ComponentCountes(),
                SizedBox(height: 10),
                Text(
                  "Tap \"+\" to increment",
                  style: TextStyle(color: Colors.white),
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
  int _currentValue = 0;

  @override
  void initState() {
    _currentValue = 50;
    super.initState();
  }

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
                    _currentValue -= 1;
                    if (_currentValue < 0) _currentValue = 0;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${_currentValue.toString()}"),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentValue += 1;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
