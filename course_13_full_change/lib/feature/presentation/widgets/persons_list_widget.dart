import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/common/app_colors.dart';
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
  final scrollController = ScrollController();

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.hasClients && scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<PersonListCubit>().loadPerson();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setupScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      bool isLoading = false;

      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
        isLoading = true;
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        return Center(child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.cloud_off_rounded, size: 42, color: AppColors.greyColor),
            const SizedBox(height: 12),
            Text(state.message, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16)),
            const SizedBox(height: 12),
            FilledButton.icon(onPressed: () => context.read<PersonListCubit>().loadPerson(), icon: const Icon(Icons.refresh), label: const Text('Try again')),
          ]),
        ));
      }
      return ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        itemBuilder: (context, index) {
          if (index < persons.length) {
            return PersonCard(person: persons[index]);
          } else {
            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
        itemCount: persons.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
