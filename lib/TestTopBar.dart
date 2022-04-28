import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_javascript_switch.dart';

class TestTopBar extends StatefulWidget {
  const TestTopBar({Key? key}) : super(key: key);

  @override
  State<TestTopBar> createState() => _TestTopBarState();
}

class _TestTopBarState extends State<TestTopBar> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 60.0,
      //   centerTitle: false,
      //   leading: Container(),
      //   //backgroundColor: Colors.white,
      //   elevation: 2,
      //   iconTheme: const IconThemeData(
      //     color: AppColors.greenSysU,
      //   ),
      //   actions: [
      //    // NavigationControls(controller: bloc.controller, title: "Créer un compte"),
      //   ],
      // ),
      body: Stack(
        children: [
          WebView(
            zoomEnabled: false,
            gestureNavigationEnabled: true,
            initialUrl:
                "https://publish-p46754-e220152.adobeaemcloud.com/magasins/superu-getigne.mobile.html",

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
            javascriptChannels:
                _createJavascriptChannels(context), // Add this line
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 12,
            color: Colors.red,
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 19,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 12,
                color: Colors.red,
                child: Image.asset("lib/img/top_bar_example_screenshot.png"),
              ),
            ],
          )
        ],
      ),
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
