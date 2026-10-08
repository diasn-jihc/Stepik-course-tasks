import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Container(
        color: index % 2 == 0 ? Colors.white : Colors.blue[50],
        child: const ListTile(
          leading: Text(
            'ID: 1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          title:Column(
            children: [
              Text(
                'My Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                Text(
                  'Email: test@test.ru',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Phone: 123456789',
                  style: TextStyle(fontStyle: FontStyle.italic),
                 ),
               ],
              ),
            ],
          )
        ),
      ),
    );
  }
}