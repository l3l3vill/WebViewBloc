import 'package:flutter/material.dart';
import 'profil_element.dart';
import 'profil_menu_tile.dart';

class ProfilMenuList extends StatelessWidget {

  final List<ProfilElement> listProfilElement;

  ProfilMenuList(this.listProfilElement);

  @override
  Widget build(BuildContext context) {
      return ListView.separated (
        itemBuilder: (context, index) => ProfilMenuTile(profilElement: listProfilElement[index]),
        itemCount: listProfilElement.length,
        separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
      ),
    );
  }
}