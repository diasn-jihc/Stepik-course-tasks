import 'package:course_12_4/bloc/user_bloc.dart';
import 'package:course_12_4/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green
            ),
          child: Text('Load'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
