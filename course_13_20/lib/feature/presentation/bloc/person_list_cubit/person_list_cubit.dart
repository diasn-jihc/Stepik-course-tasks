import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/core/error/failure.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/domain/usecases/get_all_persons.dart';
import 'package:course_13_full/feature/presentation/bloc/person_list_cubit/person_list_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMessage = 'Cache Failure';

class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;

  PersonListCubit({required this.getAllPersons}) : super(PersonEmpty());

  int page = 1;

  Future<void> loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    } else if (currentState is PersonError) {
      oldPerson = currentState.oldPersonsList;
    }

    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));

    try {
      final failureOrPerson = await getAllPersons(PagePersonParams(page: page));

      failureOrPerson.fold(
        (error) => emit(PersonError(
          message: _mapFailureToMessage(error),
          oldPersonsList: oldPerson,
        )),
        (character) {
          page++;
          emit(PersonLoaded([...oldPerson, ...character]));
        },
      );
    } catch (_) {
      emit(PersonError(
        message: 'Unable to load characters. Check your connection and retry.',
        oldPersonsList: oldPerson,
      ));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure) {
      case ServerFailure():
        return serverFailureMessage;
      case CacheFailure():
        return cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }

}
