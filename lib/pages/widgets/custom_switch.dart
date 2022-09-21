import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool initValue;
  final double width;
  final double height;
  final Color onColor;
  final Color offColor;
  final double offset;
  final double borderRadius;
  final int duration;
  final Function action;

  const CustomSwitch({
    Key? key,
    required this.initValue,
    required this.width,
    required this.height,
    required this.onColor,
    required this.offColor,
    this.offset = 0.0,
    this.borderRadius = 100,
    this.duration = 100,
    required this.action,
  }) : super(key: key);

  @override
  CustoSwitchState createState() => CustoSwitchState();
}

class CustoSwitchState extends State<CustomSwitch> {
  late Color _switchColor;
  late bool _isActive;
  late double _switchPosition;

  @override
  @override
  void initState() {
    super.initState();
    _isActive = widget.initValue;

    if (_isActive) {
      _switchColor = widget.onColor;
      _switchPosition = 1.0;
    } else {
      _switchColor = widget.offColor;
      _switchPosition = -1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: SizedBox(
            width: widget.width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: widget.duration),
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      color: _switchColor,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: widget.duration),
                  alignment: Alignment(_switchPosition, 0.0),
                  width: widget.width,
                  height: widget.height,
                  child: Container(
                    width: widget.height - widget.offset * 2,
                    height: widget.height - widget.offset * 2,
                    margin: EdgeInsets.all(widget.offset),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              _isActive = !_isActive;
              if (_isActive) {
                _switchColor = widget.onColor;
                _switchPosition = 1.0;
              } else {
                _switchColor = widget.offColor;
                _switchPosition = -1.0;
              }
            });
            widget.action();
          },
        ),
      ],
    );
  }
}
