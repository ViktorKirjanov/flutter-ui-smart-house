import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/cubit/tabs_cubit.dart';
import '../../../core/models/app_tab.dart';
import '../../../core/models/room.dart';
import '../../../data/room_parameters.dart';
import 'parameters_grid.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  @override
  Widget build(BuildContext context) {
    const colorsList = [
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(144, 175, 208, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ];

    return Flexible(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
            colors: [
              Color.fromRGBO(235, 244, 253, 1),
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            BlocBuilder<TabsCubit, AppTab>(
              builder: (_, state) {
                final Room selectedRoom =
                    rooms.firstWhere((Room room) => room.tab == state);
                return Center(
                  child: ParametersGrid(parameters: selectedRoom.parameters),
                );
              },
            ),
            Center(
              child: Container(
                width: 1.0,
                height: 80.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.5, 1.0],
                    colors: colorsList,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 80.0,
                height: 1.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    stops: [0.0, 0.5, 1.0],
                    colors: colorsList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
