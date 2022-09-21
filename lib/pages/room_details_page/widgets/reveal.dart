import 'dart:math';

import 'package:flutter/material.dart';

enum Direction { leftToRight, rightToLeft }

class Reveal extends StatelessWidget {
  final double revealPersent;
  final Direction direction;
  final Widget child;

  const Reveal({
    Key? key,
    required this.revealPersent,
    required this.direction,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircleRevealClipper(revealPersent, direction),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;
  final Direction direction;

  CircleRevealClipper(this.revealPercent, this.direction);

  // start from bottom center
  // @override
  // Rect getClip(Size size) {
  //   final epicenter = Offset(size.width / 2, size.height * .9);

  //   // final epicenter = Offset(0, 0);
  //   final double theta = atan(epicenter.dy / epicenter.dx);
  //   final distanceToCorner = epicenter.dy / sin(theta);

  //   final radius = distanceToCorner * revealPercent;
  //   final diameter = 2 * radius;
  //   return Rect.fromLTWH(
  //       epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  //   // return Rect.fromLTWH(-radius, -radius, diameter, diameter);
  // }

  // start from left top
  @override
  Rect getClip(Size size) {
    late Offset epicenter;
    if (direction == Direction.leftToRight) {
      epicenter = const Offset(1.0, 1.0);
    } else if (direction == Direction.rightToLeft) {
      epicenter = Offset(size.width, 1.0);
    }
    final distanceToCorner =
        sqrt(size.width * size.width + size.height * size.height);

    final radius = distanceToCorner * revealPercent;
    final diameter = 2 * radius;
    return Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
