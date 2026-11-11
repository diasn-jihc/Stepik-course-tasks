import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'user.dart';
import 'home_page.dart';

// Providers
// Provider
// StateProvider
// StateNotifier & StateNotifierProvider
// ChangeNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User(name: '', age: 0)),
);

final userChangeNotifierProvider = ChangeNotifierProvider<UserNotifierChange>(
  (ref) => UserNotifierChange(),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Демонстрация Riverpod', theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF0B1715), appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)), inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D))), home: MyHomePage());
  }
}
