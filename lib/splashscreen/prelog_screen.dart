import 'package:flutter/material.dart';

import '../assets/components/app_colors.dart';

class PrelogScreen extends StatelessWidget {
  const PrelogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /3,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/img/logo_super_u.png")
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Transform.rotate(
                  angle: - 0.03,
                  alignment: Alignment.topLeft,
                  child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 21,
                      decoration: const BoxDecoration(
                        color: AppColors.yellowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Bienvenue !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'RobotoSlab',
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 16,
                    child: TextButton(
                      child: const Text(
                          "Je m'identifie",
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
                          borderRadius:
                              BorderRadius.circular(25.0),
                        )
                    ),
                    onPressed: () async {
                        print("Je m'identifie");
                      },
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greenSysU,   
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 16,
                  child: TextButton(
                    child: const Text(
                        "Je crée un compte",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )
                  ),
                  onPressed: () async {
                      print("Je crée un compte");
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
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10
                    ),
                    child: Image.asset("lib/assets/img/ic_smartphone_connect.png"),
                    
                  ),
                  const Text("Vous cherchez un magasin ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Trouver un magasin U",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      print("Trouver un magasin U");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
