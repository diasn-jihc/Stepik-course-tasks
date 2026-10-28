import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions {
  clearCache,
  clearCookies,
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _webController;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (await _webController.canGoBack()) {
          await _webController.goBack();
        } else {
          log('Нет записи в истории');
        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  _webController.goBack();
                } else {
                  log('Нет записи в истории');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  _webController.goForward();
                } else {
                  log('Нет записи в истории');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () => _webController.reload(),
            ),
            PopupMenuButton<MenuOptions>(
              onSelected: (value) {
                switch (value) {
                  case MenuOptions.clearCache:
                    break;
                  case MenuOptions.clearCookies:
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuItem<MenuOptions>>[
                const PopupMenuItem(
                  value: MenuOptions.clearCache,
                  child: Text('Удалить кеш'),
                ),
                const PopupMenuItem(
                  value: MenuOptions.clearCookies,
                  child: Text('Удалить Cookies'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: Colors.red,
              backgroundColor: Colors.black,
            ),
            Expanded(
              child: WebView(
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
                onPageStarted: (url) {
                  log('Новый сайт: $url');
                },
                onPageFinished: (url) {
                  log('Страница полностью загружена');
                },
                navigationDelegate: (request) {
                  if (request.url.startsWith('https://m.youtube.com')) {
                    log('Навигация заблокирована к $request');
                    return NavigationDecision.prevent;
                  }
                  log('Навигация разрешена к $request');
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan, size: 32),
          onPressed: () async {
            final currentUrl = await _webController.currentUrl();
            log('Предыдущий сайт: $currentUrl');
            _webController.loadUrl('https://www.youtube.com');
          },
        ),
      ),
    );
  }
}
