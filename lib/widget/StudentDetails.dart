import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/widget/allRelatedClases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';

class StudentDetails extends StatelessWidget {
  final List<Room> rooms;
  final Student student;

  const StudentDetails({
    Key? key,
    required this.rooms,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Students classes'),
        ...rooms.map(
          (Room room) {
            Color? color = Colors.green[400];
            // bool isPresent = findStudent(room, student.id).isPresent;
            // Color? color = isPresent ? Colors.green[400] : Colors.red[400];
            // Icon icon = isPresent
            //     ? Icon(Icons.account_circle_outlined)
            //     : Icon(Icons.no_accounts);

            return BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.all(8),
                  color: color,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5),
                        Text(room.name),
                        AllRelatedClasses(room: room, active: false),
                        Card(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () => roomPage(context, room),
                            icon: Icon(Icons.class__outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ).toList()
      ],
    );
  }
}
