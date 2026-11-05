import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user.dart';
import 'home_page.dart';
import 'logger_riverpod.dart';

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

final fetchUserprovider =
    FutureProvider.autoDispose.family<User, String>((ref, String userId) {
  log('Init: fetchUser($userId)');

  ref.onCancel(() => log('Cancel: fetchUser($userId)'));
  ref.onResume(() => log('Resume: fetchUser($userId)'));
  ref.onDispose(() => log('Dispose: fetchUser($userId)'));

  final link = ref.keepAlive();

  Timer? timer;

  ref.onDispose(() => timer?.cancel());

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 10), () => link.close());
  });

  ref.onResume(() => timer?.cancel());

  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(userId);
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );
});

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()],
      child: const MyApp(),
    ),
  );
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
