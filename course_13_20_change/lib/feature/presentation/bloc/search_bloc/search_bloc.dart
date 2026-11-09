
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/core/error/failure.dart';
import 'package:course_13_full/feature/domain/usecases/search_person.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMessage = 'Cache Failure';
class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty()) {
    on<SearchPersons>(_onEvent);
  }

  FutureOr<void> _onEvent(
      SearchPersons event, Emitter<PersonSearchState> emit) async {
    emit(PersonSearchLoading());
    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: event.personQuery));
    emit(failureOrPerson.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoaded(persons: person)));
  }

    String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMessage;
      case CacheFailure _:
        return cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
