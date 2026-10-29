import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(
    BuildContext context, {
    required String text,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 32),
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class TextRowWidget extends StatelessWidget {
  final String title;
  final String value;

  const TextRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      );
}
