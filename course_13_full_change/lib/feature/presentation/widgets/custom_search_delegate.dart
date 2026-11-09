import 'package:flutter/material.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:course_13_full/feature/presentation/widgets/search_result.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');

  final _suggestions = [
    'Rick',
    'Morty',
    'Summer',
    'Beth',
    'Jerry',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        tooltip: 'Back',
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<PersonSearchBloc>(context, listen: false).add(SearchPersons(query));

    return BlocBuilder<PersonSearchBloc, PersonSearchState>(
      builder: (context, state) {
        if (state is PersonSearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSearchLoaded) {
          final person = state.persons;
          if (person.isEmpty) {
            return _showErrorText('No Characters with that name found');
          }
          return ListView.builder(
            itemCount: person.length,
            itemBuilder: (context, int index) {
              PersonEntity result = person[index];
              return SearchResult(personResult: result);
            },
          );
        } else if (state is PersonSearchError) {
          return _showErrorText(state.message);
        } else {
          return Center(
            child: Icon(Icons.now_wallpaper),
          );
        }
      },
    );
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: AppColors.mainBackground,
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.history_rounded, color: AppColors.accent),
          title: Text(_suggestions[index], style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: const Icon(Icons.north_west_rounded, size: 18, color: AppColors.greyColor),
          onTap: () {
            query = _suggestions[index];
            showResults(context);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 1, indent: 54, color: AppColors.cellBackground);
      },
      itemCount: _suggestions.length,
    );
  }
}
