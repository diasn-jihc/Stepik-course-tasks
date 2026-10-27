
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:course_13_full/core/error/exception.dart';
import 'package:course_13_full/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonFromUrl(
        Uri.https('rickandmortyapi.com', '/api/character', {'page': '$page'}),
      );

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonFromUrl(
        Uri.https('rickandmortyapi.com', '/api/character', {'name': query}),
      );

  Future<List<PersonModel>> _getPersonFromUrl(Uri url) async {
    final response = await client
        .get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
