import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user.dart';
import 'home_page.dart';

// Providers
// Provider
// StateProvider
// StateNotifier & StateNotifierProvider
// ChangeNotifierProvider
// FutureProvider
// StreamProvider
// tuple
// freezed
// equatable
// riverpod_generator

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(const User(name: '', email: '')),
// );
// final userChangeNotifierProvider =
//     ChangeNotifierProvider<UserNotifierChange>((ref) => UserNotifierChange());

// final fetchUserprovider = FutureProvider<User>((ref) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData();
// }); // FutureProvider

final fetchUserProvider = FutureProvider.family<User, String>((ref, userId) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(userId);
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );
}); // StreamProvider

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Riverpod',
      home: MyHomePage(),
    );
  }
}
