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
      title: 'WebView Local',
      theme: ThemeData.dark(),
      home: const WebViewLocalPage(),
    );
  }
}
