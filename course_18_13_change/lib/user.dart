import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'user.g.dart';

@immutable
class User {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  User copyWith({String? name, String? email}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

// Provider
@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository();

// Repository
class UserRepository {
  Future<User> fetchUserData(String userId) {
    final url = 'https://jsonplaceholder.typicode.com/users/$userId';
    return http
        .get(Uri.parse(url))
        .then((value) => User.fromJson(value.body));
  }
}

// Previous lessons: StateNotifier & ChangeNotifier
class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }
}

class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: '', email: '');

  void updateName(String name) {
    user = user.copyWith(name: name);
    notifyListeners();
  }
}
