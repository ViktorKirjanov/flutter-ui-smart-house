import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_house/core/blocs/tabs/tabs_bloc.dart';
import 'package:smart_house/core/models/app_tab.dart';
import 'package:smart_house/core/models/room.dart';
import 'package:smart_house/data/room_parameters.dart';
import 'package:smart_house/pages/widgets/dot.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, AppTab>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rooms
                .where((Room room) => room.isActive)
                .map(
                  (Room room) => _buildNavigationItem(
                    room: room.name,
                    icon: room.icon,
                    active: room.tab ==
                        Provider.of<TabsBloc>(context, listen: false).state,
                    action: () => BlocProvider.of<TabsBloc>(context).add(
                      UpdateTab(room.tab),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildNavigationItem({
    @required String room,
    @required IconData icon,
    @required Function action,
    bool active = false,
  }) {
    return GestureDetector(
      child: Container(
        height: 100.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Color.fromRGBO(94, 124, 154, active ? 1 : .4),
              size: 32.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            SizedBox(width: 10.0),
            RotatedBox(
              quarterTurns: -1,
              child: Text(
                room,
                style: TextStyle(
                  color: Color.fromRGBO(94, 124, 154, active ? 1 : .4),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            (active) ? Dot(size: 8.0) : SizedBox(width: 8.0),
          ],
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}
