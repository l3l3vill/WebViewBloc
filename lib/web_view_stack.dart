import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'TestTopBar.dart';
import 'bottom_bar.dart';
import 'webview_javascript_switch.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, Key? key}) : super(key: key);

  final Completer<WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          zoomEnabled: false,
          gestureNavigationEnabled: true,
          initialUrl:
              "https://www.lemonde.fr/",
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          navigationDelegate: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('youtube.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels:_createJavascriptChannels(context), // Add this line
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          //   Container(
          //     color: Colors.blue,
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height / 10,
          //     child: Column(
          //         children: [
          //       //     TextButton(
          //       //   child: const Text("Go web view JS",
          //       //   style: TextStyle(
          //       //     color: Colors.black
          //       //   ),
          //       //   ),
          //       //   onPressed: () {
          //       //     Navigator.push(context,
          //       //         MaterialPageRoute(builder: (BuildContext context) {
          //       //       return WebViewJavaScriptSwitch();
          //       //     }));
          //       //   },
          //       // ),
          //       // TextButton(
          //       //     child: const Text("Go To Test Top Bar",
          //       //     style: TextStyle(
          //       //       color: Colors.black
          //       //     ),
          //       //     ),
          //       //     onPressed: () {
          //       //       Navigator.push(context,
          //       //           MaterialPageRoute(builder: (BuildContext context) {
          //       //         return TestTopBar();
          //       //       }));
          //       //     },
          //       //   ),
          //         // TextButton(
          //         //   child: const Text("Go To Test Tab Bar",
          //         //   style: TextStyle(
          //         //     color: Colors.black
          //         //   ),
          //         //   ),
          //         //   onPressed: () {
          //         //     Navigator.push(context,
          //         //         MaterialPageRoute(builder: (BuildContext context) {
          //         //       return BottomBarNav();
          //         //     }
          //         //     )
          //         //     );
          //         //   },
          //         // ),
                  
          //       ],
          //     ),
          //   ),
           ],
        ),
      ],
    );
  }

  // Add from here ...
  Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
    return {
      JavascriptChannel(
        name: 'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      ),
    };
  }
  // ... to here.
}
