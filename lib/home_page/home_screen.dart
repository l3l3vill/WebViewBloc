import 'package:flutter/material.dart';

import '../fidelity_card/fidelity_card.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
       // appBar: SuperUAppBar(title: "homeScreen"),
        body: OrientationBuilder(
          builder: (context, orientation) {
          return Center(
            child: orientation == Orientation.portrait 
            ? WebViewApp() 
            : const FidelityCard() 
            
            );
           }
          )
        )
    );
  }


Widget _portraitView(){

    // Return Your Widget View Here Which you want to Load on Portrait Orientation.
    return Container(
    width: 300.00,
    color: Colors.green,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: const Text(' Portrait View Detected. ',
            textAlign: TextAlign.center,  
            style: TextStyle(fontSize: 24, color: Colors.white)));
  }
}