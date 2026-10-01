import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Чтение и запись локального файла',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
      ),
      home: ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  @override
  _ReadWriteFileExampleState createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  static const String kLocalFileName = 'demo_localfile.txt';
  String _localFileContent = '';
  String _localFilePath = kLocalFileName;

  @override
  void initState() {
    super.initState();
    this._readTextFromLocalFile();
    this._getLocalFile.then((file) => setState(() => this._localFilePath = file.path));
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(color: Colors.teal.shade800);
    return Scaffold(
      appBar: AppBar(
        title: Text('Чтение и запись файла'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text('Запись в локальный файл:', style: titleStyle),
          TextField(
            focusNode: _textFieldFocusNode,
            controller: _textController,
            maxLines: null,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: 'Введите текст...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              MaterialButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Text('Загрузить', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await this._readTextFromLocalFile();
                  this._textController.text = this._localFileContent;
                  FocusScope.of(context).requestFocus(_textFieldFocusNode);
                  log('Строка успешно загружена из локального файла');
                },
              ),
              MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('Сохранить', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await this._writeTextToLocalFile(this._textController.text);
                  this._textController.clear();
                  await this._readTextFromLocalFile();
                  log('Строка успешно записана в локальный файл');
                },
              ),
            ],
          ),
          Divider(height: 20.0, color: Colors.teal),
          Text('Путь к локальному файлу:', style: titleStyle),
          Text(this._localFilePath, style: Theme.of(context).textTheme.bodyLarge),
          Divider(height: 20.0, color: Colors.teal),
          Text('Содержимое локального файла:', style: titleStyle),
          Text(this._localFileContent, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/$kLocalFileName');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'Ошибка загрузки локального файла: $e';
    }
    setState(() {
      this._localFileContent = content;
    });
  }
}