import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'assets/components/app_colors.dart';

class WebViewJSSendDataToWebView extends StatefulWidget {
  @override
  _WebViewJSSendDataToWebViewState createState() =>
      _WebViewJSSendDataToWebViewState();
}

class _WebViewJSSendDataToWebViewState
    extends State<WebViewJSSendDataToWebView> {
  WebViewController? _controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formLoginScreenKey = GlobalKey<FormState>();
  TextEditingController emailLoginScreenController = TextEditingController();

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Send Data: Flutter to WebView ')),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'about:blank',
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: Set.from([
              JavascriptChannel(
                  name: 'messageHandler',
                  onMessageReceived: (JavascriptMessage message) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message.message)));
                  }),
              JavascriptChannel(
                  name: 'messageHandler1',
                  onMessageReceived: (JavascriptMessage message) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message.message)));
                  })
            ]),
            onWebViewCreated: (WebViewController webviewController) {
              _controller = webviewController;
              _loadHtmlFromAssets();
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: AppColors.greenSysU,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Form(
                  key: formLoginScreenKey,
                  child: TextFormField(
                    controller: emailLoginScreenController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "email",
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.email_outlined,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.5)),
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "errorTextFieldEmpty";
                      } else if (value != null) {
                        text = value;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_upward),
        onPressed: () {
          _controller!.runJavascript('fromFlutter("Vincent")');

          if (formLoginScreenKey.currentState!.validate()) {
            _controller!.runJavascript('fromFlutter1("${text}")');
          }
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String file = await rootBundle.loadString('lib/assets/js2/index.html');
    _controller!.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
