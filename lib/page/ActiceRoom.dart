import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/StudentCard.dart';

class ActiveRoomWidget extends StatelessWidget {
  final Room room;

  const ActiveRoomWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (BuildContext context, RoomState state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Card(
              elevation: 25,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(room.name, style: TextStyle(fontSize: 35)),
                    Text('teacher: ' + room.teacher.name),
                    Wrap(children: [
                      ...room.students
                          .map(
                            (student) => ClassStudentCard(
                                isPresent: student.isPresent,
                                student: room.studentIndex(student.id),
                                onTap: () => UseRoomCubit().changeStatus(
                                    context, room.id, room.date!, student.id)),
                          )
                          .toList()
                    ]),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
