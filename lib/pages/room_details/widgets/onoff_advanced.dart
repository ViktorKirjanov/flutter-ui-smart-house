import 'package:flutter/material.dart';
import 'package:smart_house/pages/room_details/widgets/reveal.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';

class OnoffAdvanced extends StatefulWidget {
  final String title;
  final bool isActive;
  final IconData iconData;

  const OnoffAdvanced({
    Key key,
    @required this.isActive,
    @required this.title,
    @required this.iconData,
  }) : super(key: key);

  @override
  _OnoffAdvancedState createState() => _OnoffAdvancedState();
}

class _OnoffAdvancedState extends State<OnoffAdvanced>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  bool _deviceStatuce;

  @override
  void initState() {
    super.initState();
    _deviceStatuce = widget.isActive;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _deviceStatuce = !_deviceStatuce;
          _controller.value = 0.0;
        } else if (state == AnimationStatus.dismissed) {}
      })
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
          print("value:${_animation.value}");
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 130,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(144, 175, 208, .1),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0),
              )
            ],
          ),
          child: Stack(
            children: <Widget>[
              _buildDeviceStatus(_deviceStatuce),
              Reveal(
                revealPersent: _animation.value,
                direction: (!_deviceStatuce)
                    ? Direction.LeftToRight
                    : Direction.RightToLeft,
                child: _buildDeviceStatus(!_deviceStatuce),
              ),
              Positioned(
                top: 15.0,
                right: 20.0,
                child: CustomSwitch(
                  initValue: _deviceStatuce,
                  width: 32,
                  height: 18,
                  onColor: Color.fromRGBO(9, 119, 132, 1),
                  offColor: Color.fromRGBO(121, 170, 224, 1),
                  offset: 2.0,
                  action: () {
                    _controller.forward();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceStatus(bool isActive) {
    return Container(
      decoration: new BoxDecoration(
        color: (isActive) ? Color.fromRGBO(64, 191, 207, 1) : Colors.white,
        borderRadius: new BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(
          color: Color.fromRGBO(208, 226, 242, 1),
          width: 1,
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 0.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: (isActive)
                      ? Colors.white
                      : Color.fromRGBO(105, 144, 186, 1),
                  size: 36.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                SizedBox(height: 15.0),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: (!isActive)
                        ? Color.fromRGBO(189, 207, 227, 1.0)
                        : Colors.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  (isActive) ? "ON" : "OFF",
                  style: TextStyle(
                    color: (isActive)
                        ? Colors.white
                        : Color.fromRGBO(105, 144, 186, 1),
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
