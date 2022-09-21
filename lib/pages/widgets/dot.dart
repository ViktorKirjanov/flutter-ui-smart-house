import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double size;

  const Dot({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(144, 175, 208, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
    );
  }
}
