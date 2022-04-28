import 'package:flutter/material.dart';

import 'profil_element.dart';
import 'test_example.dart';

class ProfilMenuTile extends StatelessWidget {
  final ProfilElement profilElement;
  ProfilMenuTile({Key? key, required this.profilElement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: InkWell(
        onTap: () {
          print("profilElement ${profilElement.title}");
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return TestExampleProfilMenu(title: profilElement.title);
            }
            )
          );
        },
        child: Row(
          children: [
            Icon(
              profilElement.iconData,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(profilElement.title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w600,
              )
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            ),
          ],
        ),
      )
    );
  }
}
