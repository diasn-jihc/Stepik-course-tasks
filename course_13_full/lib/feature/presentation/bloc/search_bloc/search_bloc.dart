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
        return serverFailureMessage;
      case CacheFailure:
        return cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
