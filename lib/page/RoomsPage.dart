import 'package:cubitroom/const.dart';
import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/dialogs/addRoomDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
        actions: <Widget>[
          // studentAction(context),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                return Wrap(
                  children: [
                    ...state.rooms
                        .where((room) => room.date == null)
                        .map(
                          (s) => Center(
                            child: GestureDetector(
                              onTap: () => roomPage(context, s),
                              child: Card(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(s.name,
                                          style: TextStyle(fontSize: 35)),
                                      Text('teacher: ' + s.teacher.name),
                                      Text(
                                        '${s.students.length} students in this class',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: btn(
              context,
              Colors.lightGreen,
              'Add Room',
              Icons.room,
              (context) => addRoomDialog(context),
            ),
          ),
          // TextButton.icon(
          //   onPressed: () {
          //     Room room = Room(
          //       students: [],
          //       name: 'history',
          //       teacher: Teacher(name: 'as', id: 145),
          //     );

          //     UseRoomCubit().add(context, room);
          //     // useAddRoom(context, room);
          //   },
          //   icon: Icon(Icons.add),
          //   label: Text('add'),
          // ),
        ],
      ),
    );
  }
}
