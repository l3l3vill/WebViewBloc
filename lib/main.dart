import 'dart:async';
import 'dart:io';                            // Add this import. 
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottom_bar.dart';
import 'menu.dart';
import 'navigation_controls.dart';
import 'web_view_stack.dart';

void main() {
  runApp(
    MaterialApp(
      home: BottomBarNav(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller), 
        ],
      ),
      body: WebViewStack(controller: controller),    // Replace the WebView widget with WebViewStack
    );
  }
}