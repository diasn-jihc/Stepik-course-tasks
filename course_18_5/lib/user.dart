import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() => 'User(name: $name, age: $age)';
}

class UserNotifier extends Notifier<User> {
  @override
  User build() => const User(name: '', age: 0);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAge(int age) {
    state = state.copyWith(age: age);
  }
}

final userProvider = NotifierProvider<UserNotifier, User>(UserNotifier.new);

class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: '', age: 0);

  void updateName(String name) {
    user = user.copyWith(name: name);
    notifyListeners();
  }

  void updateAge(int age) {
    user = user.copyWith(age: age);
    notifyListeners();
  }
}

final userChangeNotifierProvider = ChangeNotifierProvider<UserNotifierChange>(
  (ref) => UserNotifierChange(),
);
