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

  void onSubmitAge(WidgetRef ref, String value) {
    final age = int.tryParse(value);
    if (age != null) {
      ref.read(userProvider.notifier).updateAge(age);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider.select((value) => value.name));
    final userAge = ref.watch(userProvider.select((value) => value.age));

    ref.listen(userProvider, (previousState, currentState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Our age was ${previousState?.age} and the new age ${currentState.age}',
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
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
            child: Text(userAge.toString()),
          ),
        ],
      ),
    );
  }
}
