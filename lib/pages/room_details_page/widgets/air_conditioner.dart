import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_house/pages/room_details_page/widgets/reveal.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AirConditioner extends StatefulWidget {
  final String title;
  final bool isActive;
  final IconData iconData;

  const AirConditioner({
    Key? key,
    required this.isActive,
    this.title = "Air Conditioner",
    this.iconData = SmartHouse.conditioner,
  }) : super(key: key);

  @override
  AirConditionerState createState() => AirConditionerState();
}

class AirConditionerState extends State<AirConditioner>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late bool _deviceStatuce;

  double _value = 23;

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
          log("forward");
        } else if (state == AnimationStatus.completed) {
          log("completed");
          _deviceStatuce = !_deviceStatuce;
          _controller.value = 0.0;
        } else if (state == AnimationStatus.dismissed) {
          log("dismissed");
        }
      })
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 230,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
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
                    ? Direction.leftToRight
                    : Direction.rightToLeft,
                child: _buildDeviceStatus(!_deviceStatuce),
              ),
              Positioned(
                top: 15.0,
                right: 20.0,
                child: CustomSwitch(
                  initValue: _deviceStatuce,
                  width: 32,
                  height: 18,
                  onColor: const Color.fromRGBO(9, 119, 132, 1),
                  offColor: const Color.fromRGBO(121, 170, 224, 1),
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
      decoration: BoxDecoration(
        color:
            (isActive) ? const Color.fromRGBO(64, 191, 207, 1) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(
          color: const Color.fromRGBO(208, 226, 242, 1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  widget.iconData,
                  color: (isActive)
                      ? Colors.white
                      : const Color.fromRGBO(105, 144, 186, 1),
                  size: 50.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                const SizedBox(height: 15.0),
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
                                ? const Color.fromRGBO(189, 207, 227, 1.0)
                                : Colors.white.withOpacity(.5),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          (isActive) ? "ON" : "OFF",
                          style: TextStyle(
                            color: (isActive)
                                ? Colors.white
                                : const Color.fromRGBO(105, 144, 186, 1),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${_value.toInt()} °C',
                      style: TextStyle(
                        color: (isActive)
                            ? Colors.white
                            : const Color.fromRGBO(105, 144, 186, .7),
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          _buildScale(),
          SfSlider(
            min: 11.0,
            max: 30.0,
            value: _value,
            showTicks: false,
            showLabels: false,
            enableTooltip: false,
            minorTicksPerInterval: 1,
            activeColor:
                isActive ? Colors.white : const Color.fromRGBO(64, 191, 207, 1),
            thumbIcon: Icon(
              SmartHouse.thermometer,
              color: (!isActive)
                  ? Colors.white
                  : const Color.fromRGBO(64, 191, 207, 1),
              size: 12,
            ),
            onChanged: (dynamic value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScale() {
    List<Widget> children = [];
    for (var i = 12; i <= 28; i += 4) {
      children.add(_buildTemperatureLabel(i));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _buildTemperatureLabel(int value) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: (widget.isActive)
                    ? Colors.white
                    : const Color.fromRGBO(196, 212, 228, 1),
              ),
            ),
            Text(
              '°C',
              style: TextStyle(
                fontSize: 13.0,
                color: (widget.isActive)
                    ? Colors.white
                    : const Color.fromRGBO(196, 212, 228, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Container(
          width: 1.0,
          height: 8.0,
          color: (widget.isActive)
              ? Colors.white
              : const Color.fromRGBO(196, 212, 228, 1),
        ),
      ],
    );
  }
}
