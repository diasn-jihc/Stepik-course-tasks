import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user.dart';

// class MyWidget extends ConsumerStatefulWidget {
//   const MyWidget({super.key});

//   @override
//   ConsumerState<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends ConsumerState<MyWidget> {

//   @override
//   void initState() {
//     super.initState();
//     final name = ref.read(nameProvider);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);
//     return Text(name);
//   }
// }

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    final age = int.tryParse(value.trim());
    if (age != null && age >= 0) {
      ref.read(userProvider.notifier).updateAge(age);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider.select((user) => user.name));
    final userAge = ref.watch(userProvider.select((user) => user.age));

    ref.listen(userProvider.select((user) => user.age), (previousAge, currentAge) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Возраст изменился: $previousAge → $currentAge',
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
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text('Возраст: $userAge'),
          ),
        ],
      ),
    );
  }
}
