import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLocalPage extends StatefulWidget {
  const WebViewLocalPage({super.key});

  @override
  State<WebViewLocalPage> createState() => _WebViewLocalPageState();
}

class _WebViewLocalPageState extends State<WebViewLocalPage> {
  late final WebViewController _webController;
  int _progress = 0;
  String? _loadError;

  bool get _isUnsupportedPlatform =>
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux;

  @override
  void initState() {
    super.initState();
    // Do not call the platform channel on desktop targets where the plugin
    // has no implementation.
    if (_isUnsupportedPlatform) return;

    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) setState(() => _progress = progress);
          },
          onPageStarted: (_) {
            if (mounted) setState(() => _loadError = null);
          },
        ),
      )
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
    // webview_flutter does not provide a Windows implementation. Showing a
    // clear message here avoids the MissingPluginException red screen when
    // this course project is launched with the Windows desktop target.
    if (_isUnsupportedPlatform) {
      return Scaffold(
        appBar: AppBar(title: const Text('WebView Local')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Бұл WebView жобасы Android, iOS немесе macOS құрылғысында '
              'іске қосылады. Android эмуляторын таңдаңыз.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('WebView Local')),
      body: WebViewWidget(controller: _webController),
    );
  }

}
