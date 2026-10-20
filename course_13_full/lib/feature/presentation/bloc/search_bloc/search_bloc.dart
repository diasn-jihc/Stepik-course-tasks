import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_13_full/core/error/failure.dart';
import 'package:course_13_full/feature/domain/usecases/search_person.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:course_13_full/feature/presentation/bloc/search_bloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty()) {
    on<SearchPersons>((event, emit) async {
      emit(PersonSearchLoading());
      final result = await searchPerson(SearchPersonParams(query: event.personQuery));
      emit(result.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (persons) => PersonSearchLoaded(persons: persons),
      ));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
