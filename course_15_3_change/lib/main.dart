import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:course_15_3/bloc_observable.dart';
import 'package:course_15_3/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  HydratedBloc.storage = storage;
  Bloc.observer = CharacterBlocObservable();
  runApp(const MyApp());

  // Bloc.observer = CharacterBlocObservable();
  // runApp(
  //   const MyApp(),
  // );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рик и Морти',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43C6AC), brightness: Brightness.dark),
        primaryColor: const Color(0xFF43C6AC),
        scaffoldBackgroundColor: const Color(0xFF0B1715),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF142522), foregroundColor: Color(0xFFE8F4F1)),
        inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFF1A302D)),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xFFE8F4F1)),
          displayMedium: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xFFE8F4F1)),
          displaySmall: TextStyle(fontSize: 24.0, color: Color(0xFFE8F4F1)),
          bodyMedium: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFFE8F4F1)),
          bodyLarge: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w200, color: Color(0xFFE8F4F1)),
          bodySmall: TextStyle(
              fontSize: 11.0, fontWeight: FontWeight.w100, color: Color(0xFF7FAFA6)),
        ),
      ),
      home: HomePage(title: 'Рик и Морти'),
    );
  }
}
