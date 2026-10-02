import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Р§С‚РµРЅРёРµ Рё Р·Р°РїРёСЃСЊ Р»РѕРєР°Р»СЊРЅРѕРіРѕ С„Р°Р№Р»Р°',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
      ),
      home: const ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  const ReadWriteFileExample({super.key});
  @override
  State<ReadWriteFileExample> createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  static const String kLocalFileName = 'demo_localfile.txt';
  String _localFileContent = '';
  String _localFilePath = kLocalFileName;

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _readTextFromLocalFile();
    _getLocalFile.then((file) {
      if (mounted) setState(() => _localFilePath = file.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(color: Colors.teal.shade800);
    return Scaffold(
      appBar: AppBar(
        title: Text('Р§С‚РµРЅРёРµ Рё Р·Р°РїРёСЃСЊ С„Р°Р№Р»Р°'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text('Р—Р°РїРёСЃСЊ РІ Р»РѕРєР°Р»СЊРЅС‹Р№ С„Р°Р№Р»:', style: titleStyle),
          TextField(
            focusNode: _textFieldFocusNode,
            controller: _textController,
            maxLines: null,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: 'Р’РІРµРґРёС‚Рµ С‚РµРєСЃС‚...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          OverflowBar(
            spacing: 8,
            children: <Widget>[
              MaterialButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Text('Р—Р°РіСЂСѓР·РёС‚СЊ', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await _readTextFromLocalFile();
                  if (!context.mounted) return;
                  _textController.text = _localFileContent;
                  FocusScope.of(context).requestFocus(_textFieldFocusNode);
                  log('РЎС‚СЂРѕРєР° СѓСЃРїРµС€РЅРѕ Р·Р°РіСЂСѓР¶РµРЅР° РёР· Р»РѕРєР°Р»СЊРЅРѕРіРѕ С„Р°Р№Р»Р°');
                },
              ),
              MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('РЎРѕС…СЂР°РЅРёС‚СЊ', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await _writeTextToLocalFile(_textController.text);
                  if (!context.mounted) return;
                  _textController.clear();
                  await _readTextFromLocalFile();
                  log('РЎС‚СЂРѕРєР° СѓСЃРїРµС€РЅРѕ Р·Р°РїРёСЃР°РЅР° РІ Р»РѕРєР°Р»СЊРЅС‹Р№ С„Р°Р№Р»');
                },
              ),
            ],
          ),
          Divider(height: 20.0, color: Colors.teal),
          Text('РџСѓС‚СЊ Рє Р»РѕРєР°Р»СЊРЅРѕРјСѓ С„Р°Р№Р»Сѓ:', style: titleStyle),
          Text(_localFilePath, style: Theme.of(context).textTheme.bodyLarge),
          Divider(height: 20.0, color: Colors.teal),
          Text('РЎРѕРґРµСЂР¶РёРјРѕРµ Р»РѕРєР°Р»СЊРЅРѕРіРѕ С„Р°Р№Р»Р°:', style: titleStyle),
          Text(_localFileContent, style: Theme.of(context).textTheme.bodyLarge),
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

  Future<void> _readTextFromLocalFile() async {
    late final String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'РћС€РёР±РєР° Р·Р°РіСЂСѓР·РєРё Р»РѕРєР°Р»СЊРЅРѕРіРѕ С„Р°Р№Р»Р°: $e';
    }
    if (!mounted) return;
    setState(() => _localFileContent = content);
  }
}
