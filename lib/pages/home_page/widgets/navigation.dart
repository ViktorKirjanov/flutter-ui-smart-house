import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_house/core/models/app_tab.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/data/room_parameters.dart';
import 'package:smart_house/pages/widgets/dot.dart';

import '../../../core/blocs/cubit/tabs_cubit.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, AppTab>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rooms
                .where((Room room) => room.isActive)
                .map(
                  (Room room) => _buildNavigationItem(
                    room: room.name,
                    icon: room.icon,
                    active: room.tab ==
                        Provider.of<TabsCubit>(context, listen: false).state,
                    action: () {
                      BlocProvider.of<TabsCubit>(context).updateTab(room.tab);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildNavigationItem({
    required String room,
    required IconData icon,
    required Function action,
    bool active = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(144, 175, 208, .2),
          splashColor: const Color.fromRGBO(144, 175, 208, .5),
          customBorder: const CircleBorder(),
          child: SizedBox(
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Color.fromRGBO(94, 124, 154, active ? 1 : .5),
                  size: 32.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                const SizedBox(width: 10.0),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    room,
                    style: TextStyle(
                      color: Color.fromRGBO(94, 124, 154, active ? 1 : .5),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                (active) ? const Dot(size: 8.0) : const SizedBox(width: 8.0),
              ],
            ),
          ),
          onTap: () => action(),
        ),
      ),
    );
  }
}
