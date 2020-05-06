import 'package:flutter/material.dart';
import 'package:smart_house/pages/widgets/dot.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';

class CustomAppBar extends StatelessWidget {
  final double appBarHeight;
  final String title;

  const CustomAppBar({
    Key key,
    @required this.appBarHeight,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      height: appBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: IconButton(
              icon: Icon(
                SmartHouse.left_arrow,
                color: Color.fromRGBO(94, 124, 154, 1.0),
                size: 18.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(94, 124, 154, .6),
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            width: appBarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dot(size: 4.0),
                SizedBox(height: 2.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Dot(size: 3.0),
                  SizedBox(width: 5.0),
                  Dot(size: 3.0),
                ]),
                SizedBox(height: 1.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Dot(size: 4.0),
                  SizedBox(width: 16.0),
                  Dot(size: 4.0),
                ]),
                SizedBox(height: 1.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Dot(size: 3.0),
                  SizedBox(width: 5.0),
                  Dot(size: 3.0),
                ]),
                SizedBox(height: 2.0),
                Dot(size: 4.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
