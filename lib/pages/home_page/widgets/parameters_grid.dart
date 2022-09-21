import 'package:flutter/material.dart';
import 'package:smart_house/core/models/room.dart';

class ParametersGrid extends StatelessWidget {
  final List<Parameter> parameters;

  const ParametersGrid({
    Key? key,
    required this.parameters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildParameter(parameter: parameters[0]),
              const SizedBox(height: 25.0),
              _buildParameter(parameter: parameters[1]),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildParameter(
                  parameter: parameters[2], alignment: CrossAxisAlignment.end),
              const SizedBox(height: 25.0),
              _buildParameter(
                  parameter: parameters[3], alignment: CrossAxisAlignment.end),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParameter({
    required Parameter parameter,
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        Text(
          parameter.name,
          style: const TextStyle(
            color: Color.fromRGBO(129, 156, 185, 1),
            fontSize: 12.0,
          ),
        ),
        const SizedBox(height: 5.0),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Color.fromRGBO(105, 144, 186, 1),
              fontSize: 22.0,
            ),
            text: parameter.value,
            children: <TextSpan>[
              TextSpan(
                text: parameter.unit,
                style: const TextStyle(
                  color: Color.fromRGBO(105, 144, 186, 1),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
