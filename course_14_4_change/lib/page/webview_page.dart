import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { clearCache, clearCookies }

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _webController;
  double _progress = 0;

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (await _webController.canGoBack()) {
          await _webController.goBack();
        } else {
          log('РќРµС‚ Р·Р°РїРёСЃРё РІ РёСЃС‚РѕСЂРёРё');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Браузер'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  await _webController.goBack();
                } else {
                  log('РќРµС‚ Р·Р°РїРёСЃРё РІ РёСЃС‚РѕСЂРёРё');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  await _webController.goForward();
                } else {
                  log('РќРµС‚ Р·Р°РїРёСЃРё РІ РёСЃС‚РѕСЂРёРё');
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
                  child: Text('Очистить кеш'),
                ),
                const PopupMenuItem(
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
              value: _progress,
              color: const Color(0xFF43C6AC),
              backgroundColor: const Color(0xFF142522),
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
                  log('РќРѕРІС‹Р№ СЃР°Р№С‚: $url');
                  // if (url.contains('https://flutter.dev')) {
                  //   Future.delayed(const Duration(microseconds: 300), () {
                  //     _webController.runJavascript(
                  //       "document.getElementsByTagName('footer')[0].style.display='none'",
                  //     );
                  //   }); // Future.delayed
                  // }
                },
                onPageFinished: (url) {
                  log('РЎС‚СЂР°РЅРёС†Р° РїРѕР»РЅРѕСЃС‚СЊСЋ Р·Р°РіСЂСѓР¶РµРЅР°');
                  if (url.contains('https://m.facebook.com/')) {
                    if (isSubmitting) {
                      _webController.loadUrl('https://m.facebook.com/');
                      isSubmitting = false;
                    }
                  }
                },
                navigationDelegate: (request) {
                  if (request.url.startsWith('https://m.youtube.com')) {
                    log('РќР°РІРёРіР°С†РёСЏ Р·Р°Р±Р»РѕРєРёСЂРѕРІР°РЅР° Рє $request');
                    return NavigationDecision.prevent;
                  }
                  log('РќР°РІРёРіР°С†РёСЏ СЂР°Р·СЂРµС€РµРЅР° Рє $request');
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan, size: 32),
          onPressed: () async {
            isSubmitting = true;
            await _webController.runJavascript("document.forms[0].submit()");
            // final currentUrl = await _webController.currentUrl();
            // log('РџСЂРµРґС‹РґСѓС‰РёР№ СЃР°Р№С‚: $currentUrl');
            // _webController.loadUrl('https://www.youtube.com');
            // _webController.runJavascript(
            //   "document.getElementsByTagName('footer')[0].style.display='none'",
            // );
          },
        ),
      ),
    );
  }
}
