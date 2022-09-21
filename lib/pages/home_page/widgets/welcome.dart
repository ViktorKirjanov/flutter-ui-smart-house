import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final double h;
  final double w;

  const Welcome({Key? key, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35.0),
      width: w,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 30),
          Text(
            'Sept 20, 2019',
            style: TextStyle(
              color: Color.fromRGBO(94, 124, 154, .6),
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Welcome Home',
            style: TextStyle(
              color: Color.fromRGBO(94, 124, 154, 1),
              fontSize: 21.0,
            ),
          ),
        ],
      ),
    );
  }
}
