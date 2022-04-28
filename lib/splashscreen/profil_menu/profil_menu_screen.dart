import 'package:flutter/material.dart';
import 'profil_element.dart';
import 'profil_menu_list.dart';

class ProfilMenuScreen extends StatelessWidget {

  final List<ProfilElement> listProfilElement = <ProfilElement>[
    ProfilElement(title: "Mes adresses", iconData: Icons.home),
    ProfilElement(title: "Mes numéros", iconData: Icons.phone),
    ProfilElement(title: "Mes offres", iconData: Icons.android),
    ProfilElement(title: "Mes offres et défis personnalisés", iconData: Icons.access_alarm ),
    ProfilElement(title: "U Paiement", iconData: Icons.card_giftcard ),
    ProfilElement(title: "Mes E-Tickets", iconData: Icons.airplane_ticket),
    ProfilElement(title: "Mes Avantages Fidélité", iconData: Icons.card_giftcard),
];

  ProfilMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: const Text("ListView")),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Jean-Christophe Dupont",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Jc-dupont@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Transform.rotate(
                          angle: -0.03,
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.height / 22,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Paramètres du compte",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'RobotoSlab',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              child: Container(
              width: MediaQuery.of(context).size.width,
              height: 0.5,
              color: Colors.grey
            )
            ),
            
            Expanded(child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
                child: ProfilMenuList(listProfilElement)
              )
            )
          ],
        ),
      )
    );
  }
}
