import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green
          ),
          child: Text('Load'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child : const Text('Clear'),
        ),
      ],
    );
  }
}
