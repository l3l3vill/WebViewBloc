import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'splashscreen/cookies.dart';
import 'splashscreen/prelog_screen.dart';
import 'splashscreen/profil_menu/profil_element.dart';
import 'splashscreen/profil_menu/profil_menu_screen.dart';
import 'splashscreen/tutos.dart';

class WebViewJavaScriptSwitch extends StatefulWidget {
  @override
  _WebViewJavaScriptSwitchState createState() => _WebViewJavaScriptSwitchState();
}

class _WebViewJavaScriptSwitchState extends State<WebViewJavaScriptSwitch> {
  WebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Switch: listen/update webview',
          style: TextStyle(color: Colors.white,
          fontSize: 15
          ),
        ),
        actions: [],
      ),
      body: Stack(
        children: [
          buildWebView(context),
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3,
              child: Column(
                children: [
                  TextButton(
                    child: const Text("Go to tutos",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Tutos();
                      }));
                    },
                  ),
                  TextButton(
                    child: const Text("Go to Cookie",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Cookies();
                      }));
                    },
                  ),
                  TextButton(
                    child: const Text("Go to ListView",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilMenuScreen();
                      }));
                    },
                  ),
                  TextButton(
                    child: const Text("Go to Prelog",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return PrelogScreen();
                      }));
                    },
                  )

                ],
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }

  Widget buildWebView(BuildContext context) {
    return WebView(
        initialUrl: 'https://websso-int.groupement.systeme-u.fr/wam/XUI/?realm=/internet_u&service=UpwdReset#login',
        javascriptMode:
            JavascriptMode.unrestricted, // autorisation du javascript
        onWebViewCreated: (WebViewController webViewController) async {
          _webViewController = webViewController;
          String fileContent =
              await rootBundle.loadString('lib/assets/js/index.html');
          _webViewController?.loadUrl(Uri.dataFromString(fileContent,
                  mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
              .toString());
        },
        javascriptChannels: <JavascriptChannel>{
          JavascriptChannel(
            name: 'messageHandler',
            onMessageReceived: (JavascriptMessage message) {
              print("message from the web view=\"${message.message}\"");
              final script = "document.getElementById('value').innerText=\"${message.message}\"";
              _webViewController?.runJavascript((script));
            },
            
          ),
          // JavascriptChannel(
          //   name: 'messageHandler',
          //   onMessageReceived: (JavascriptMessage message1) {
          //     print("test =\"${message1.message}\"");
          //     final script = "document.getElementById('value').innerText=\"${message1.message}\"";
          //     _webViewController?.runJavascript((script));
          //   },
            
          // ),
          
          
        },
        
        
      );
  }
}
