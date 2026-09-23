import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FirstHome()));
}

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Home'), centerTitle: true),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          User user = User(name: 'Konstantin', age: 34);

          Route route = MaterialPageRoute(
            builder: (context) => SecondHome(user: user),
          );

          Navigator.push(context, route);
        },
        child: const Text('Move to Page 2'),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  const SecondHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} - ${user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
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
