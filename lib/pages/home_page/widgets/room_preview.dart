import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/cubit/tabs_cubit.dart';
import '../../../core/models/app_tab.dart';
import '../../../core/models/room.dart';
import '../../../data/room_parameters.dart';
import '../../room_details_page/room_details_page.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TabsCubit, AppTab>(
        builder: (_, state) {
          final Room selectedRoom =
              rooms.firstWhere((Room room) => room.tab == state);
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30.0, 45.0, 40.0, 50.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(34.0),
                        topRight: Radius.circular(34.0),
                        bottomLeft: Radius.circular(34.0),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(144, 175, 208, .3),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(selectedRoom.image),
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(121, 170, 224, .75),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(34.0),
                        ),
                      ),
                      child: const Text(
                        'More Details ...',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RoomDetailsPage(
                    room: selectedRoom,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
