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
//     final user = ref.read(fetchUserprovider('1'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(fetchUserprovider('1'));
//     return Text(user.toString());
//   }
// }

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userId = '1';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Пользователь'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Введите идентификатор пользователя',
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                setState(() {
                  userId = value.trim();
                });
              }
            },
          ),
          user.when(
            data: (data) {
              return Center(
                child: Text(data.name),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text('Ошибка загрузки: ${error.toString()}'),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
