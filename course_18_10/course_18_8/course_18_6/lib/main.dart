import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'user.dart';
import 'home_page.dart';

// Providers
// Provider
// StateProvider
// StateNotifier & StateNotifierProvider
// ChangeNotifierProvider
// FutureProvider

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(const User(name: '', email: '')),
// );
// final userChangeNotifierProvider =
//     ChangeNotifierProvider<UserNotifierChange>((ref) => UserNotifierChange());

final fetchUserprovider = FutureProvider<User>((ref) {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  return http
      .get(Uri.parse(url))
      .then((value) => User.fromJson(value.body));
}); // FutureProvider

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Riverpod',
      home: MyHomePage(),
    );
  }
}
