import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;

  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromRGBO(94, 124, 154, 1.0),
        fontSize: 20.0,
      ),
    );
  }
}
