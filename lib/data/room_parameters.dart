import 'package:smart_house/core/models/app_tab.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/presentation/smart_house_icons.dart';

List<Room> rooms = [
  Room(
    name: 'Living Room',
    icon: SmartHouse.sofa,
    tab: AppTab.livingRoom,
    isActive: true,
    image: 'assets/images/living_room.jpg',
    parameters: <Parameter>[
      Parameter(name: 'Temperature', value: '23', unit: ' °C'),
      Parameter(name: 'Lights', value: '7', unit: ' Lamps'),
      Parameter(name: 'Humidity', value: '75', unit: '%'),
      Parameter(name: 'Electricity', value: '1400', unit: ' Kw'),
    ],
  ),
  Room(
    name: 'Kitchen',
    icon: SmartHouse.fork,
    tab: AppTab.kitchen,
    isActive: true,
    image: 'assets/images/kitchen.jpg',
    parameters: <Parameter>[
      Parameter(name: 'Temperature', value: '21', unit: ' °C'),
      Parameter(name: 'Lights', value: '10', unit: ' Lamps'),
      Parameter(name: 'Humidity', value: '65', unit: '%'),
      Parameter(name: 'Electricity', value: '25', unit: ' Kw'),
    ],
  ),
  Room(
    name: 'Bedroom',
    icon: SmartHouse.bed,
    tab: AppTab.bedroom,
    isActive: true,
    image: 'assets/images/bedroom.jpg',
    parameters: <Parameter>[
      Parameter(name: 'Temperature', value: '22', unit: ' °C'),
      Parameter(name: 'Lights', value: '5', unit: ' Lamps'),
      Parameter(name: 'Humidity', value: '30', unit: '%'),
      Parameter(name: 'Electricity', value: '100', unit: ' Kw'),
    ],
  ),
];
