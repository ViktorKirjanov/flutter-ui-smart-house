import 'package:flutter/material.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';

class Onoff extends StatefulWidget {
  final String title;
  final bool isActive;
  final IconData iconData;

  const Onoff({
    Key? key,
    required this.isActive,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  OnoffState createState() => OnoffState();
}

class OnoffState extends State<Onoff> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 0.0),
      height: 130,
      decoration: BoxDecoration(
        color: (widget.isActive)
            ? const Color.fromRGBO(64, 191, 207, 1)
            : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(
          color: (!widget.isActive)
              ? const Color.fromRGBO(208, 226, 242, 1)
              : const Color.fromRGBO(64, 191, 207, 1),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(144, 175, 208, .1),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  widget.iconData,
                  color: (widget.isActive)
                      ? Colors.white
                      : const Color.fromRGBO(105, 144, 186, 1),
                  size: 36.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: (!widget.isActive)
                        ? const Color.fromRGBO(189, 207, 227, 1.0)
                        : Colors.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  (widget.isActive) ? "ON" : "OFF",
                  style: TextStyle(
                    color: (widget.isActive)
                        ? Colors.white
                        : const Color.fromRGBO(105, 144, 186, 1),
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Column(children: <Widget>[
              Row(children: [
                CustomSwitch(
                  initValue: widget.isActive,
                  width: 32,
                  height: 18,
                  onColor: const Color.fromRGBO(9, 119, 132, 1),
                  offColor: const Color.fromRGBO(121, 170, 224, 1),
                  offset: 2.0,
                  action: () {},
                ),
              ]),
            ]),
          ],
        ),
      ]),
    );
  }
}
