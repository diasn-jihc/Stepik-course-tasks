import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLocalPage extends StatefulWidget {
  const WebViewLocalPage({super.key});

  @override
  State<WebViewLocalPage> createState() => _WebViewLocalPageState();
}

class _WebViewLocalPageState extends State<WebViewLocalPage> {
  late final WebViewController _webController;

  @override
  void initState() {
    super.initState();
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'MyJSChannel',
        onMessageReceived: (message) async {
          log('Javascript: ${message.message}');
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                message.message,
                style: const TextStyle(fontSize: 35),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await _webController.runJavaScriptReturningResult(
                      'sendOK()',
                    );
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      )
      ..loadFlutterAsset('assets/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView Local')),
      body: WebViewWidget(controller: _webController),
    );
  }

  // void loadLocalHTML() async {
  //   final html = await rootBundle.loadString('assets/index.html');
  //   final url = Uri.dataFromString(
  //     html,
  //     mimeType: 'text/html',
  //     encoding: Encoding.getByName('utf-8'),
  //   ).toString();

  //   _webController.loadUrl(url);
  // }

  // final html = '''<!DOCTYPE html>
  // <html>
  // <body>

  // <h1>This is heading 1</h1>
  // <h2>This is heading 2</h2>
  // <h3>This is heading 3</h3>
  // <h4>This is heading 4</h4>
  // <h5>This is heading 5</h5>
  // <h6>This is heading 6</h6>

  // </body>
  // </html>''';
}
