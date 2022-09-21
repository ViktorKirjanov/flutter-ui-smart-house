import 'package:flutter/widgets.dart';
import 'package:smart_house/core/models/app_tab.dart';

class Room {
  final String name;
  final IconData icon;
  final AppTab tab;
  final bool isActive;
  final String image;
  final List<Parameter> parameters;

  Room({
    required this.name,
    required this.icon,
    required this.tab,
    required this.isActive,
    required this.image,
    required this.parameters,
  });
}

class Parameter {
  final String name;
  final String value;
  final String unit;

  Parameter({
    required this.name,
    required this.value,
    required this.unit,
  });
}
