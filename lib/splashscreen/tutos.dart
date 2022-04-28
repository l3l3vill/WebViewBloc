import 'package:flutter/material.dart';

import '../assets/components/app_colors.dart';

// class MyObject {
//   String title;
//   Icon icon;
//   MyObject({required this.title, required this.icon});
// }

class MyObject extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconData;
  MyObject(
      {Key? key,
      required this.title,
      required this.description,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          iconData,
          color: AppColors.greenSysU,
          size: MediaQuery.of(context).size.height / 7.5,
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.greenSysU,
            fontSize: 16,
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 11,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Tutos extends StatelessWidget {
  Tutos({Key? key}) : super(key: key);

  final List<Widget> kIcons = <Widget>[
    MyObject(
        title: "morbé cursus lobotis",
        description:
            " description 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        iconData: Icons.home),
    MyObject(
        title: "title 2",
        description:
            " description 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        iconData: Icons.phone),
    MyObject(
        title: "title 3",
        description:
            " description 3 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        iconData: Icons.android),
  ];

  // static const kIcons = <Icon>[
  //   Icon(Icons.event),
  //   Icon(Icons.home),
  //   Icon(Icons.android),
  // ];

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
              height: MediaQuery.of(context).size.height / 1.8,
              child: DefaultTabController(
                length: kIcons.length,
                child: Builder(
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          child: TabBarView(children: kIcons),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 38,
                        ),
                        const TabPageSelector(
                            color: Colors.transparent,
                            selectedColor: Colors.teal),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 18,
                          child: TextButton(
                            child: const Text(
                              "Passer",
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
                              final TabController controller =
                                  DefaultTabController.of(context)!;
                              if (!controller.indexIsChanging) {
                                controller.animateTo(kIcons.length - 1);
                              }
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
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 2.38,
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
                      "Comment ça marche ?",
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
