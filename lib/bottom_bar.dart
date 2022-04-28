import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_view_flutter_google_cook_book/main.dart';
import 'package:web_view_flutter_google_cook_book/webview_javascript_switch.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'TestTopBar.dart';
import 'assets/components/app_colors.dart';
import 'home_page/home_screen.dart';
import 'splashscreen/bottom_navigation_bar_item_custom.dart';
import 'webview_js_send_data_to_webview.dart';


class BottomBarNav extends StatefulWidget {
  final controller = Completer<WebViewController>();
  BottomBarNav({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarNavState();
}

class _BottomBarNavState
    extends State<BottomBarNav> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const WebViewApp(),
      //const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      WebViewJavaScriptSwitch(),
      WebViewJSSendDataToWebView(),
      const HomeScreen(),
      const TestTopBar(),
    ];

    final test = <BottomNavigationBarItemCustom>[
      BottomNavigationBarItemCustom(icon: const Icon(Icons.cloud), title: const Text("Accueil"), container: Container() ),

      
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Catalogues'),
      const BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Bons plans'),
      const BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined), label: 'Fidélité'),
      const BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Offres'),
      
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      selectedIconTheme: const IconThemeData(color: AppColors.greenSysU),
      //showSelectedLabels: false,
      fixedColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        
      ),
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}