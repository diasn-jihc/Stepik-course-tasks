import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';

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

    return user.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'User ID',
                contentPadding: EdgeInsets.all(16),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  setState(() => userId = value.trim());
                }
              },
            ),
            Center(child: Text(data.name)),
          ],
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
