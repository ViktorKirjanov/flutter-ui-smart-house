import 'package:flutter/material.dart';
import 'package:smart_house/pages/room_details_page/widgets/reveal.dart';
import 'package:smart_house/pages/widgets/custom_switch.dart';

class OnoffAdvanced extends StatefulWidget {
  final String title;
  final bool isActive;
  final IconData iconData;

  const OnoffAdvanced({
    Key? key,
    required this.isActive,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  OnoffAdvancedState createState() => OnoffAdvancedState();
}

class OnoffAdvancedState extends State<OnoffAdvanced>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late bool _deviceStatuce;

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
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 130,
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
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 0.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: (isActive)
                      ? Colors.white
                      : const Color.fromRGBO(105, 144, 186, 1),
                  size: 36.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                const SizedBox(height: 15.0),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
