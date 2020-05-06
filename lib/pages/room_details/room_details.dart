import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/pages/room_details/widgets/air_conditioner.dart';
import 'package:smart_house/pages/room_details/widgets/custom_appbar.dart';
import 'package:smart_house/pages/room_details/widgets/onoff_advanced.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';

class RoomDetails extends StatefulWidget {
  final Room room;

  const RoomDetails({Key key, @required this.room}) : super(key: key);

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  double imageTop = 250;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >= 0 && _scrollController.offset < 250.0) {
          setState(() {
            final double offset = 250.0 - _scrollController.offset;
            imageTop = (offset >= 0) ? offset : 0.0;
          });
        } else {
          setState(() {
            imageTop = 250.0;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.width * .3;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        controller: _scrollController,
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
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(80.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                      image: AssetImage(widget.room.image),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 45.0, 40.0, 0.0),
                  margin: EdgeInsets.only(top: imageTop),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      colors: [
                        Color.fromRGBO(247, 248, 250, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(80.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Devices',
                          style: TextStyle(
                            color: Color.fromRGBO(94, 124, 154, 1.0),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: AirConditioner(isActive: false),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                      ),
                      SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
