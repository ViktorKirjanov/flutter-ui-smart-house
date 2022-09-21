import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35.0, top: 35.0),
      child: Row(
        children: [
          const Image(image: AssetImage('assets/icons/rain.png')),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Outdoor',
                style: TextStyle(
                  color: Color.fromRGBO(94, 124, 154, .6),
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Partly Cloudy',
                style: TextStyle(
                  color: Color.fromRGBO(94, 124, 154, 1),
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
