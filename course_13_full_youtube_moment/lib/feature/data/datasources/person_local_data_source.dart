import 'dart:convert';

import 'package:course_13_full/core/error/exception.dart';
import 'package:course_13_full/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  /// Gets the cached [List<PersonModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const cachedPersonsList = 'CACHED_PERSONS_LIST';

class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache() async {
    final jsonPersonsList =
        sharedPreferences.getStringList(cachedPersonsList);
    if (jsonPersonsList != null && jsonPersonsList.isNotEmpty) {
      return jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList();
    }
    throw CacheException();
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();

    return sharedPreferences.setStringList(cachedPersonsList, jsonPersonsList);
  }
}
