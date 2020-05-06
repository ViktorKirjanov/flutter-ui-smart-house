import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_house/core/blocs/tabs/tabs_bloc.dart';
import 'package:smart_house/core/models/app_tab.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/data/room_parameters.dart';
import 'package:smart_house/pages/home/widgets/menu.dart';
import 'package:smart_house/pages/home/widgets/parameters.dart';
import 'package:smart_house/pages/home/widgets/welcome.dart';
import 'package:smart_house/pages/room_details/room_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double wLeft = w * 0.7;
    final double wRight = w * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              width: wLeft,
              child: Column(
                children: <Widget>[
                  Welcome(w: wLeft, h: wRight),
                  Flexible(
                    flex: 7,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(60.0),
                              bottomLeft: const Radius.circular(70.0),
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
                          child: Container(
                            width: wLeft,
                            child: Column(
                              children: [
                                _buildWeather(),
                                _buildImage(context: context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildParameters(),
                ],
              ),
            ),
            Menu(width: wRight),
          ],
        ),
      ),
    );
  }

  Widget _buildWeather() {
    return Container(
      padding: EdgeInsets.only(left: 40.0, top: 36.0),
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/icons/rain.png'),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Outdoor',
                style: TextStyle(
                  color: Color.fromRGBO(94, 124, 154, .6),
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Partly Cloudy',
                style: TextStyle(
                  color: Color.fromRGBO(94, 124, 154, 1),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage({@required BuildContext context}) {
    return Expanded(
      child: BlocBuilder<TabsBloc, AppTab>(builder: (context, state) {
        final Room selectedRoom =
            rooms.firstWhere((Room room) => room.tab == state);
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.fromLTRB(40.0, 45.0, 40.0, 50.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(34.0),
                      topRight: const Radius.circular(34.0),
                      bottomLeft: const Radius.circular(34.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(144, 175, 208, .3),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(selectedRoom.image),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(0, 1),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 170, 224, .75),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(34.0),
                      ),
                    ),
                    child: Text(
                      'More Details ...',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RoomDetails(
                  room: selectedRoom,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildParameters() {
    final List<Color> _colorsList = [
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(144, 175, 208, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ];

    return Flexible(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
            colors: [
              Color.fromRGBO(235, 244, 253, 1),
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            BlocBuilder<TabsBloc, AppTab>(
              builder: (context, state) {
                final Room selectedRoom =
                    rooms.firstWhere((Room room) => room.tab == state);

                return Center(
                  child: Parameters(
                    parameters: selectedRoom.parameters,
                  ),
                );
              },
            ),
            Center(
              child: Container(
                width: 1.0,
                height: 80.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.5, 1.0],
                    colors: _colorsList,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 80.0,
                height: 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    stops: [0.0, 0.5, 1.0],
                    colors: _colorsList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
