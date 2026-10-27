import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _webController;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) setState(() => _progress = progress);
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  Future<void> _goBack() async {
    if (await _webController.canGoBack()) {
      await _webController.goBack();
    }
  }

  Future<void> _goForward() async {
    if (await _webController.canGoForward()) {
      await _webController.goForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            tooltip: 'Назад',
            onPressed: _goBack,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            tooltip: 'Вперёд',
            onPressed: _goForward,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          IconButton(
            tooltip: 'Обновить',
            onPressed: _webController.reload,
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_progress < 100) LinearProgressIndicator(value: _progress / 100),
          Expanded(child: WebViewWidget(controller: _webController)),
        ],
      ),
    );
  }
}
