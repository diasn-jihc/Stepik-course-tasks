import 'package:course_15_2/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc()..add(const CounterEvent.start()),
      child: MaterialApp(
        title: 'Генерация кода',
        theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF0B1715), appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)), inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D))),
        home: const CounterPage(),
      ),
    );
  }
}
