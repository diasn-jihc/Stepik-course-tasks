import 'dart:convert';

import 'package:course_15_3/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    try {
      final response = await http.get(Uri.parse(url).replace(
        queryParameters: {
          'page': page.toString(),
          if (name.trim().isNotEmpty) 'name': name.trim(),
        },
      ));

      if (response.statusCode != 200) {
        throw Exception('Character request failed (${response.statusCode})');
      }

      final jsonResult = json.decode(response.body) as Map<String, dynamic>;
      return Character.fromJson(jsonResult);
    } on FormatException catch (error) {
      throw Exception('Invalid character response: $error');
    }
  }
}
