import 'dart:developer';
import 'package:flutter/material.dart';
import 'helper.dart';

class GlobalKeyExampleTwo extends StatefulWidget {
  const GlobalKeyExampleTwo({super.key});

  @override
  State<GlobalKeyExampleTwo> createState() => _GlobalKeyExampleTwoState();
}

class _GlobalKeyExampleTwoState extends State<GlobalKeyExampleTwo> {
  final _formKey = GlobalKey<FormState>();
  
  bool isSignedIn = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Пример GlobalKey 2'),
          centerTitle: true,
        ),
        body: isSignedIn ? buildHome() : buildLogin(),
      );

  Widget buildLogin() => Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'Not a Valid Электронная почта!'
                  : null,
                onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Пароль',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Пароль needs 3 characters.'
                  : null,
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF168B7E),
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: submit,
              child: const FittedBox(
                child: Text(
                  'Войти',
                  style: TextStyle(fontSize: 20, color: Color(0xFFE8F4F1)),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Добро пожаловать',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Электронная почта', value: email),
            TextRowWidget(title: 'Пароль', value: password),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF168B7E),
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () => setState(() => isSignedIn = false),
              child: const FittedBox(
                child: Text(
                  'Выйти из аккаунта',
                  style: TextStyle(fontSize: 20, color: Color(0xFFE8F4F1)),
                ),
              ),
            ),
          ],
        ),
      );

  void submit() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      log('Form valid: $email');

      setState(() => isSignedIn = true);
    }
  }
}
