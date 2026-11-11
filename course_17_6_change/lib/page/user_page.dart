import 'package:flutter/material.dart';
import 'package:course_17_6/entities/user.dart';
import 'package:course_17_6/user_remote_repository/user_remote_repository.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController controller = TextEditingController(text: '0');
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Демонстрация TDD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user == null ? const Text('Нет данных') : Text('Идентификатор: ${user!.id}'),
            if (user != null) Text('Имя: ${user!.name}'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      user = await UserRemoteRepository()
                          .getUser(int.tryParse(controller.text) ?? 0);

                      setState(() {});
                    },
                    child: const Text('Загрузить пользователя')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
