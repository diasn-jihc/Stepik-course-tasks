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
    ref.read(userChangeNotifierProvider).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    final age = int.tryParse(value);
    if (age != null) {
      ref.read(userChangeNotifierProvider).updateAge(age);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangeNotifierProvider).user;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}
