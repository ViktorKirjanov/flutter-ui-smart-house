import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/pages/home/widgets/navigation.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';
import 'package:smart_house/pages/widgets/dot.dart';

class Menu extends StatefulWidget {
  final double width;

  const Menu({Key key, this.width}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(232, 244, 255, 1),
      width: widget.width,
      child: Column(
        children: <Widget>[
          Container(
            height: widget.width,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(214, 234, 253, 1),
              borderRadius: new BorderRadius.only(
                bottomRight: Radius.circular(widget.width / 2),
              ),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Dot(size: 5.0),
                      SizedBox(height: 12.0),
                      Dot(size: 5.0),
                    ],
                  ),
                  SizedBox(width: 12.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Dot(size: 8.0),
                      SizedBox(height: 8.0),
                      Dot(size: 8.0)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Navigation()),
          CustomSwitch(
            initValue: false,
            width: 40,
            height: 20,
            onColor: Color.fromRGBO(121, 170, 224, 1),
            offColor: Color.fromRGBO(121, 170, 224, .3),
            offset: 2.0,
          ),
          SizedBox(height: 70.0),
        ],
      ),
    );
  }
}
