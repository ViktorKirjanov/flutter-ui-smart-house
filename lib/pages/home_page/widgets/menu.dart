import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/pages/home_page/widgets/navigation.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';
import 'package:smart_house/pages/widgets/dot.dart';

class Menu extends StatefulWidget {
  final double width;

  const Menu({Key? key, required this.width}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(232, 244, 255, 1),
      width: widget.width,
      child: Column(
        children: <Widget>[
          Container(
            height: widget.width,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(214, 234, 253, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(widget.width / 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Dot(size: 5.0),
                    SizedBox(height: 12.0),
                    Dot(size: 5.0),
                  ],
                ),
                const SizedBox(width: 12.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Dot(size: 8.0),
                    SizedBox(height: 8.0),
                    Dot(size: 8.0)
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: Navigation()),
          CustomSwitch(
            initValue: false,
            width: 40,
            height: 20,
            onColor: const Color.fromRGBO(121, 170, 224, 1),
            offColor: const Color.fromRGBO(121, 170, 224, .3),
            offset: 2.0,
            action: () {},
          ),
          const SizedBox(height: 70.0),
        ],
      ),
    );
  }
}
