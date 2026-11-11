import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

// class MyWidget extends ConsumerStatefulWidget {
//   const MyWidget({super.key});
//
//   @override
//   ConsumerState<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends ConsumerState<MyWidget> {
//   @override
//   void initState() {
//     super.initState();
//     final user = ref.read(userProvider);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(userProvider);
//     return Text(user.name);
//   }
// }

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Профиль пользователя'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Введите имя'),
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          Center(child: Text(user.name)),
        ],
      ),
    );
  }
}
