import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart' as windows_webview;

enum MenuOptions { clearCache, clearCookies }

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webController;
  final _windowsController = windows_webview.WebviewController();
  bool _windowsReady = false;
  bool _canGoBack = false;
  bool _canGoForward = false;
  String? _windowsError;
  double _progress = 0;

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
      await _windowsController.loadUrl('https://flutter.dev');
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
      if (_canGoBack) {
        await _windowsController.goBack();
      } else {
        log('No page in history');
      }
    } else if (await _webController.canGoBack()) {
      await _webController.goBack();
    } else {
      log('No page in history');
    }
  }

  Future<void> _goForward() async {
    if (Platform.isWindows) {
      if (_canGoForward) await _windowsController.goForward();
    } else if (await _webController.canGoForward()) {
      await _webController.goForward();
    }
  }

  Future<void> _reload() => Platform.isWindows
      ? _windowsController.reload()
      : _webController.reload();

  Future<void> _openYoutube() => Platform.isWindows
      ? _windowsController.loadUrl('https://www.youtube.com')
      : _webController.loadUrl('https://www.youtube.com');

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _goBack();
      },
      child: Scaffold(
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
            IconButton(icon: const Icon(Icons.replay), onPressed: _reload),
            PopupMenuButton<MenuOptions>(
              onSelected: (value) {
                switch (value) {
                  case MenuOptions.clearCache:
                  case MenuOptions.clearCookies:
                    break;
                }
              },
              itemBuilder: (context) => const <PopupMenuItem<MenuOptions>>[
                PopupMenuItem(
                  value: MenuOptions.clearCache,
                  child: Text('Очистить кеш'),
                ),
                PopupMenuItem(
                  value: MenuOptions.clearCookies,
                  child: Text('Очистить файлы cookie'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: Platform.isWindows ? null : _progress,
              color: const Color(0xFF43C6AC),
              backgroundColor: const Color(0xFF142522),
            ),
            Expanded(
              child: Platform.isWindows
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
                      initialUrl: 'https://flutter.dev',
                      onWebViewCreated: (controller) {
                        _webController = controller;
                      },
                      onProgress: (progress) {
                        if (mounted) {
                          setState(() => _progress = progress / 100);
                        }
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openYoutube,
          child: const Icon(Icons.next_plan, size: 32),
        ),
      ),
    );
  }
}
