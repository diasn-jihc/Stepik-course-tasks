import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart' as windows_webview;

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  final _windowsController = windows_webview.WebviewController();
  bool _windowsReady = false;
  bool _canGoBack = false;
  bool _canGoForward = false;
  String? _windowsError;

  @override
  void initState() {
    super.initState();
    if (Platform.isWindows) _initializeWindowsWebView();
  }

  Future<void> _initializeWindowsWebView() async {
    try {
      await _windowsController.initialize();
      await _windowsController.setPopupWindowPolicy(
        windows_webview.WebviewPopupWindowPolicy.deny,
      );
      _windowsController.historyChanged.listen((history) {
        if (!mounted) return;
        setState(() {
          _canGoBack = history.canGoBack;
          _canGoForward = history.canGoForward;
        });
      });
      await _windowsController.loadUrl('http://info.cern.ch');
      if (mounted) setState(() => _windowsReady = true);
    } catch (error) {
      if (mounted) setState(() => _windowsError = error.toString());
    }
  }

  @override
  void dispose() {
    if (Platform.isWindows) _windowsController.dispose();
    super.dispose();
  }

  Future<void> _goBack() async {
    if (Platform.isWindows) {
      if (_canGoBack) await _windowsController.goBack();
    } else if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  Future<void> _goForward() async {
    if (Platform.isWindows) {
      if (_canGoForward) await _windowsController.goForward();
    } else if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  Future<void> _reload() => Platform.isWindows
      ? _windowsController.reload()
      : _controller.reload();

  Future<void> _openYoutube() => Platform.isWindows
      ? _windowsController.loadUrl('https://www.youtube.com')
      : _controller.loadUrl('https://www.youtube.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Браузер'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: _goBack,
            ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: _goForward,
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: _reload,
          ),
        ],
      ),
      body: Platform.isWindows
          ? _windowsError != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Не удалось запустить WebView2:\n$_windowsError',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : _windowsReady
                  ? windows_webview.Webview(_windowsController)
                  : const Center(child: CircularProgressIndicator())
          : WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'http://info.cern.ch',
              onWebViewCreated: (controller) => _controller = controller,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openYoutube,
        child: const Icon(Icons.next_plan, size: 32),
      ),
    );
  }
}

