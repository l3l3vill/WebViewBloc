import 'package:flutter/material.dart';

import '../assets/components/app_colors.dart';

class Cookies extends StatelessWidget {
  Cookies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://wallpaperaccess.com/full/3770388.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        right: 20,
                        left: 20,
                      ),
                      child: Text(
                          "La Coopérative U Enseigne et ses partenaires utilisent des ''cookies'' (traceurs) pour personnaliser le site, effectuer des mesures d'audience et mener des actions publicitaires. Vous pouvez exercer vos droits et notamment retirer votre consentement à tout moment. Pour plus d'informations, vous pouvez consulter la politique de gestion des traceurs."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        right: 20,
                        left: 20,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              child: Row(
                                children: [
                                  const Text(
                                    "Personnalisation",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'RobotoSlab',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.grey,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print("personnalisation");
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey,
                          ),
                          InkWell(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              child: Row(
                                children: [
                                  const Text(
                                    "Mesure d'audience",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'RobotoSlab',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.grey,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print("Mesure d'audience");
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey,
                          ),
                          InkWell(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              child: Row(
                                children: [
                                  const Text(
                                    "Publicité",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'RobotoSlab',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.grey,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print("Publicité");
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 18,
                            child: TextButton(
                              child: const Text(
                                "Paramétrer mes cookies",
                                style: TextStyle(
                                  color: AppColors.greenSysU,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                              onPressed: () async {
                                print("Paramétrer mes cookies");
                              },
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greenSysU,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        right: 20,
                        left: 20,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 18,
                            child: TextButton(
                              child: const Text(
                                "Tout refuser",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              onPressed: () async {
                                print("Tout refuser");
                              },
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greenSysU,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 18,
                            child: TextButton(
                              child: const Text(
                                "Tout accepter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                              onPressed: () async {
                                print("Tout accepter");
                              },
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greenSysU,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer()
                  ],
                )),
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 4.8,
            left: MediaQuery.of(context).size.width / 5,
            child: Transform.rotate(
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
                  children: [
                    const Text(
                      "Question Cookie ?",
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
            )),
      ],
    ));
  }
}
