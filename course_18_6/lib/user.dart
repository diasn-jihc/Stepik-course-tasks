import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
      };

  factory User.fromMap(Map<String, dynamic> map) => User(
        name: map['name'] as String,
        email: map['email'] as String,
      );

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && other.name == name && other.email == email;

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final fetchUserProvider = FutureProvider<User>((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  final client = HttpClient();
  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load user: ${response.statusCode}');
    }

    return User.fromJson(body);
  } finally {
    client.close();
  }
});
