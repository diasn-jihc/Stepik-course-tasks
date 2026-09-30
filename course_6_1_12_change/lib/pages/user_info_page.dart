import 'package:flutter/material.dart';
import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;

  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Details',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Card(
        margin: const EdgeInsets.all(20.0),
        color: Colors.deepPurple[50],
        elevation: 6,
        child: Column(
          children: [
            ListTile(
              title: Text(
                userInfo.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(
                userInfo.story,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.deepPurple,
                size: 38,
              ),
              trailing: Text(
                userInfo.country,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
            ListTile(
              title: Text(
                userInfo.phone,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
              leading: const Icon(
                Icons.phone_android,
                color: Colors.teal,
                size: 30,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.email.isEmpty ? 'Email not provided' : userInfo.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.indigo,
                ),
              ),
              leading: const Icon(
                Icons.alternate_email,
                color: Colors.indigo,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}