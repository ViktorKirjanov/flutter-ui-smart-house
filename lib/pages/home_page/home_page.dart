import 'package:flutter/material.dart';

import 'package:smart_house/pages/home_page/widgets/menu.dart';
import 'package:smart_house/pages/home_page/widgets/parameters.dart';
import 'package:smart_house/pages/home_page/widgets/room_preview.dart';
import 'package:smart_house/pages/home_page/widgets/weather.dart';
import 'package:smart_house/pages/home_page/widgets/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final wLeft = width * 0.7;
    final wRight = width * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: wLeft,
              child: Column(
                children: <Widget>[
                  Welcome(w: wLeft, h: wRight),
                  Flexible(
                    flex: 7,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, .5, 1.0],
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(244, 249, 255, 1),
                                Color.fromRGBO(235, 244, 253, 1),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60.0),
                              bottomLeft: Radius.circular(70.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0],
                              colors: [
                                Color.fromRGBO(244, 249, 255, 1),
                                Color.fromRGBO(255, 255, 255, 1),
                              ],
                            ),
                          ),
                          child: SizedBox(
                            width: wLeft,
                            child: Column(
                              children: const [
                                Weather(),
                                ImagePreview(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Parameters(),
                ],
              ),
            ),
            Menu(width: wRight),
          ],
        ),
      ),
    );
  }
}
