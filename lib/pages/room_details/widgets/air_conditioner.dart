import 'package:flutter/material.dart';
import 'package:smart_house/pages/room_details/widgets/reveal.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';

class AirConditioner extends StatefulWidget {
  final String title;
  final bool isActive;
  final IconData iconData;

  const AirConditioner({
    Key key,
    this.isActive,
    this.title = "Air Conditioner",
    this.iconData = SmartHouse.conditioner,
  }) : super(key: key);

  @override
  _AirConditionerState createState() => _AirConditionerState();
}

class _AirConditionerState extends State<AirConditioner>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  bool _deviceStatuce;

  int _value = 10;

  @override
  void initState() {
    super.initState();
    _deviceStatuce = widget.isActive;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.forward) {
          print("forward");
        } else if (state == AnimationStatus.completed) {
          print("completed");
          _deviceStatuce = !_deviceStatuce;
          _controller.value = 0.0;
        } else if (state == AnimationStatus.dismissed) {
          print("dismissed");
        }
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
          height: 230,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    widget.iconData,
                    color: (isActive)
                        ? Colors.white
                        : Color.fromRGBO(105, 144, 186, 1),
                    size: 50.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                          ),
                        ],
                      ),
                      Text(
                        '23 °C',
                        style: TextStyle(
                          color: (isActive)
                              ? Colors.white
                              : Color.fromRGBO(105, 144, 186, .7),
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildTemperatureLabel(12, isActive),
                  _buildTemperatureLabel(16, isActive),
                  _buildTemperatureLabel(20, isActive),
                  _buildTemperatureLabel(24, isActive),
                  _buildTemperatureLabel(28, isActive),
                ],
              ),
            ),
            Container(
              child: Slider(
                value: _value.toDouble(),
                min: 1.0,
                max: 20.0,
                activeColor:
                    (isActive) ? Colors.white : Color.fromRGBO(64, 191, 207, 1),
                inactiveColor: (isActive)
                    ? Colors.white.withAlpha(25)
                    : Color.fromRGBO(121, 170, 224, .25),
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue.round();
                  });
                },
                semanticFormatterCallback: (double newValue) {
                  return '${newValue.round()} dollars';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemperatureLabel(int value, bool isActive) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: (isActive)
                    ? Colors.white
                    : Color.fromRGBO(196, 212, 228, 1),
              ),
            ),
            Text(
              '°C',
              style: TextStyle(
                fontSize: 13.0,
                color: (isActive)
                    ? Colors.white
                    : Color.fromRGBO(196, 212, 228, 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Container(
          width: 1.0,
          height: 8.0,
          color: (isActive) ? Colors.white : Color.fromRGBO(196, 212, 228, 1),
        ),
      ],
    );
  }
}
