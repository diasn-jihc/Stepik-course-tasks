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
        title: Text('Characters'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: AppColors.accent,
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
