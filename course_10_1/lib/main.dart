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
      title: 'Local file read/write Demo',
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
    _loadInitialFile();
  }

  Future<void> _loadInitialFile() async {
    try {
      final file = await _getLocalFile;
      // Create the file on first launch so Load starts with an empty document.
      if (!await file.exists()) await file.create(recursive: true);
      final content = await file.readAsString();
      if (!mounted) return;
      setState(() {
        _localFilePath = file.path;
        _localFileContent = content;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _localFileContent = 'Error loading local file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local file read/write Demo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text('Write to local file:', style: TextStyle(fontSize: 20)),
          TextField(
            focusNode: _textFieldFocusNode,
            controller: _textController,
            maxLines: null,
            style: TextStyle(fontSize: 20)
          ),
          OverflowBar(
            children: <Widget>[
              MaterialButton(
                child: Text('Load', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await _readTextFromLocalFile();
                  if (!context.mounted) return;
                  _textController.text = _localFileContent;
                  FocusScope.of(context).requestFocus(_textFieldFocusNode);
                  log('Text successfully loaded from local file');
                },
              ),
              MaterialButton(
                child: Text('Save', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  try {
                    await _writeTextToLocalFile(_textController.text);
                    if (!context.mounted) return;
                    await _readTextFromLocalFile();
                    log('Text successfully written to local file');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved successfully')),
                    );
                  } catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not save file: $e')),
                    );
                  }
                },
              ),
            ],
          ),
          Divider(height: 20.0),
          Text('Local file path:', style: Theme.of(context).textTheme.titleLarge),
          Text(_localFilePath, style: Theme.of(context).textTheme.bodyLarge),
          Divider(height: 20.0),
          Text('Local file content:', style: Theme.of(context).textTheme.titleLarge),
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
    try {
      final file = await _getLocalFile;
      final content = await file.exists() ? await file.readAsString() : '';
      if (!mounted) return;
      setState(() {
        _localFilePath = file.path;
        _localFileContent = content;
      });
    } catch(e) {
      if (!mounted) return;
      setState(() => _localFileContent = 'Error loading local file: $e');
    }
  }
}
