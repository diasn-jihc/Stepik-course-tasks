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
//     final user = ref.read(fetchUserprovider);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(fetchUserprovider);
//     return Text(user.toString());
//   }
// }

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserprovider);

    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Text(data.name),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
