import 'package:cubitroom/const.dart';
import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';

class AllRelatedClasses extends StatelessWidget {
  final Room room;
  final bool active;
  const AllRelatedClasses({
    Key? key,
    required this.room,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        return Column(
          children: [
            ...state.rooms
                .where((ro) => ro.id == room.id && ro.date != null)
                .map(
                  (room) {
                    return Container(
                      color: isActiveClass(room) ? Colors.green : Colors.white,
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: GestureDetector(
                        onTap: () => active ? acticeRoom(context, room) : {},
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text('id: ${room.id}'),
                                Text(room.name, style: TextStyle(fontSize: 35)),
                                Text('teacher: ' + room.teacher.name),
                                Text(
                                  'date: ' + room.date.toString().split('.')[0],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                .toList()
                .reversed
          ],
        );
      },
    );
  }
}
