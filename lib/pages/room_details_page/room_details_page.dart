import 'package:flutter/material.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/pages/room_details_page/widgets/air_conditioner.dart';
import 'package:smart_house/pages/room_details_page/widgets/custom_appbar.dart';
import 'package:smart_house/pages/room_details_page/widgets/onoff_advanced.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';

import 'header.dart';

class RoomDetailsPage extends StatefulWidget {
  final Room room;

  const RoomDetailsPage({Key? key, required this.room}) : super(key: key);

  @override
  RoomDetailsPageState createState() => RoomDetailsPageState();
}

class RoomDetailsPageState extends State<RoomDetailsPage> {
  final imageTop = 250.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.width * .3;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: <Widget>[
              CustomAppBar(
                appBarHeight: appBarHeight,
                title: widget.room.name,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.centerLeft,
                        image: AssetImage(widget.room.image),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 0.0),
                    margin: EdgeInsets.only(top: imageTop),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color.fromRGBO(247, 248, 250, 1),
                          Color.fromRGBO(255, 255, 255, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Header(text: 'Devices'),
                        const SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Lamps",
                                isActive: false,
                                iconData: SmartHouse.led,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Television",
                                isActive: true,
                                iconData: SmartHouse.tv,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const AirConditioner(isActive: false),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 1",
                                isActive: false,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 2",
                                isActive: true,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 3",
                                isActive: true,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 4",
                                isActive: true,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 5",
                                isActive: false,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: OnoffAdvanced(
                                title: "Camera 6",
                                isActive: false,
                                iconData: SmartHouse.cctv,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
