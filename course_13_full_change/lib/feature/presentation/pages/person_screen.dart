import 'package:flutter/material.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:course_13_full/feature/presentation/widgets/custom_search_delegate.dart';
import 'package:course_13_full/feature/presentation/widgets/persons_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rick & Morty', style: TextStyle(fontSize: 12, color: AppColors.accent, fontWeight: FontWeight.w700, letterSpacing: 1.4)),
            Text('Characters', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: AppColors.accent,
            tooltip: 'Search characters',
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: PersonsList(),
    );
  }
}
