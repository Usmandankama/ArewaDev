// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewExample extends StatefulWidget {
//   @override
//   State<WebViewExample> createState() => _WebViewExampleState();
// }

// class _WebViewExampleState extends State<WebViewExample> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..loadHtmlString('''
//         <html>
//         <body>
//           <h1>Hello from Offline HTML</h1>
//           <textarea style="width: 100%; height: 300px;"></textarea>
//         </body>
//         </html>
//       ''');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('HTML Editor')),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }
