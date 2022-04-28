import 'package:flutter/material.dart';

class ProfilElement extends StatelessWidget {
  final String title;
  final IconData iconData;

  ProfilElement({required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData),
          Text(title),
        ],
      ),
    );
  }
}

