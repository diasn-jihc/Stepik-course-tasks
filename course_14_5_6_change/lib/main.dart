import 'package:flutter/material.dart';

import 'page/webview_local_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Локальная веб-страница',
      theme: ThemeData.dark(useMaterial3: true).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark), scaffoldBackgroundColor: const Color(0xFF0B1715), appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)), inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D))),
      home: const WebViewLocalPage(),
    );
  }
}
