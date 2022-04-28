import 'package:flutter/material.dart';

class BottomNavigationBarItemCustom extends BottomNavigationBarItem {
  Container container;
  Text title;
  BottomNavigationBarItemCustom({required this.title, required Widget icon, required this.container})
      : super(icon: icon);
}
