import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:course_13_full/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:course_13_full/feature/presentation/widgets/person_card_widget.dart';

class PersonsList extends StatefulWidget {
  const PersonsList({super.key});

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreWhenNeeded);
  }

  void _loadMoreWhenNeeded() {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter < 300) {
      context.read<PersonListCubit>().loadPerson();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      bool isLoading = false;
      String? errorMessage;

      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
        isLoading = true;
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        persons = state.oldPersonsList;
        errorMessage = state.message;
      }
      return ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index < persons.length) {
            return PersonCard(person: persons[index]);
          } else if (errorMessage != null) {
            return TextButton(
              onPressed: () => context.read<PersonListCubit>().loadPerson(),
              child: Text(errorMessage!),
            );
          } else {
            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: persons.length + (isLoading || errorMessage != null ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
