import 'dart:developer';
import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Users loaded successfully')),
          );
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              'No users. Press "Get Users"',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.green[50],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      state.loadedUser[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          'Phone: ${state.loadedUser[index].phone}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Failed to load users',
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.redAccent,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}