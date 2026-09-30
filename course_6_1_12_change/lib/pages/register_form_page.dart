import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user.dart';
import 'user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final List<String> _countries = ['Россия', 'Казахстан', 'Германия', 'Франция'];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Форма регистрации'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Полное имя *',
                hintText: 'Как к вам обращаться?',
                prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.deepOrange,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
              validator: _validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[()\d -]{1,15}$')),
              ],
              decoration: InputDecoration(
                labelText: 'Номер телефона *',
                hintText: 'Как с вами связаться?',
                helperText: 'Формат: (XXX)XXX-XXXX',
                prefixIcon: const Icon(Icons.call, color: Colors.deepPurple),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.deepOrange,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
              validator: (value) => _validatePhoneNumber(value ?? '')
                  ? null
                  : 'Номер должен быть формата (###)###-####',
              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
                hintText: 'Введите адрес почты',
                icon: Icon(Icons.mail, color: Colors.deepPurple),
              ),
              validator: _validateEmail,
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map, color: Colors.deepPurple),
                labelText: 'Страна',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                if (country == null) return;
                setState(() {
                  _selectedCountry = country;
                  newUser.country = country;
                });
              },
              value: _selectedCountry,
              validator: (val) {
                return val == null ? 'Пожалуйста, выберите страну' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _storyController,
              decoration: const InputDecoration(
                labelText: 'О себе',
                hintText: 'Расскажите немного о себе',
                helperText: 'Кратко, это демонстрационное поле',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              onSaved: (value) => newUser.story = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Пароль *',
                hintText: 'Введите пароль',
                suffixIcon: IconButton(
                  icon: Icon(
                    _hidePass ? Icons.visibility : Icons.visibility_off,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: const Icon(Icons.security, color: Colors.deepPurple),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: const InputDecoration(
                labelText: 'Подтвердите пароль *',
                hintText: 'Повторите пароль',
                icon: Icon(Icons.border_color, color: Colors.deepPurple),
              ),
              validator: _validateConfirmPassword,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text(
                'Отправить форму',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _nameController.text);
      print('Имя: ${_nameController.text}');
      print('Телефон: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Страна: $_selectedCountry');
      print('О себе: ${_storyController.text}');
    } else {
      _showMessage(message: 'Форма заполнена неверно! Проверьте данные');
    }
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-zА-Яа-яЁё ]+$');
    if (value == null || value.isEmpty) {
      return 'Имя обязательно для заполнения.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Пожалуйста, используйте только буквы.';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email не может быть пустым';
    } else if (!value.contains('@')) {
      return 'Некорректный адрес email';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length != 8) {
      return 'Пароль должен состоять из 8 символов';
    } else {
      return null;
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.deepOrange,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Регистрация успешна',
            style: TextStyle(
              color: Colors.teal,
            ),
          ),
          content: Text(
            '$name успешно зарегистрирован(а)',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Подтвердить',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}