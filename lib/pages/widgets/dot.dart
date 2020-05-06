import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double size;

  const Dot({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
        color: Color.fromRGBO(144, 175, 208, 1),
        borderRadius: new BorderRadius.all(
          Radius.circular(size),
        ),
      ),
    );
  }
}
