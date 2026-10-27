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
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            log('WebView error: ${error.description}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'MyJSChannel',
        onMessageReceived: (message) => _showMessage(message.message),
      )
      ..loadFlutterAsset('assets/index.html');
  }

  Future<void> _showMessage(String message) async {
    log('Javascript: $message');
    if (!mounted) return;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        content: Text(message, style: const TextStyle(fontSize: 24)),
        actions: [
          TextButton(
            onPressed: () async {
              await _webController.runJavaScript('sendOK()');
              if (dialogContext.mounted) Navigator.pop(dialogContext);
            },
            child: const Text('Хорошо'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView Local')),
      body: WebViewWidget(controller: _webController),
    );
  }
}
