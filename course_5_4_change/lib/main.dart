import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const FirstHome(),
    routes: {
      '/first': (context) => const FirstHome(),
      '/second': (context) => const SecondHome(),
    },
  ));
}

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: 'Dias', age: 17);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: const Text('Open Profile'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  const SecondHome({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final user = settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} | ${user.age} years'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Return Home'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  User({required this.name, required this.age});
}