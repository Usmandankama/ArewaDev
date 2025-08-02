import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlPreviewScreen extends StatelessWidget {
  final String code;
  const HtmlPreviewScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadHtmlString(code);

    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: WebViewWidget(controller: controller),
    );
  }
}
