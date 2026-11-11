import 'package:flutter/material.dart';

enum LiveState { alive, dead, unknown }

class CharacterStatus extends StatelessWidget {
  final LiveState liveState;
  const CharacterStatus({super.key, required this.liveState});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: 11,
          color: liveState == LiveState.alive
              ? const Color(0xFF43C6AC)
              : liveState == LiveState.dead
                  ? const Color(0xFFFF718B)
                  : const Color(0xFF7FAFA6),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          liveState == LiveState.dead
              ? 'Мёртв'
              : liveState == LiveState.alive
                  ? 'Жив'
                  : 'Неизвестно',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
