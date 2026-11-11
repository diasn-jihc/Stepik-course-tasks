import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_15_3/bloc/character_bloc.dart';
import 'package:course_15_3/data/repositories/character_repo.dart';
import 'package:course_15_3/ui/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;
  final repository = CharacterRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142522),
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: BlocProvider(
        create: (context) => CharacterBloc(characterRepo: repository),
        child: Container(
            decoration: const BoxDecoration(color: Color(0xFF0B1715)),
            child: const SearchPage()),
      ),
    );
  }
}
