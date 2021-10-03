import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:flutter/material.dart';

import '../Navigator.dart';
import 'StudentCard.dart';

class AcctiveRoomCard extends StatelessWidget {
  final Room room;
  final bool isManager;

  const AcctiveRoomCard({
    Key? key,
    required this.room,
    required this.isManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget showStudents(Student student) {
      return isManager
          ? StudentInList(
              student: student,
              onTap: () =>
                  UseRoomCubit().removeFromRoom(context, student.id, room.id),
            )
          : StudentInList(student: student, onTap: () {});
    }

    return Card(
      elevation: 25,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(room.name, style: TextStyle(fontSize: 35)),
            Text('teacher: ' + room.teacher.name),
            Wrap(children: [...room.students.map(showStudents).toList()]),
            if (!isManager)
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () => roomPage(context, room, isManager: true),
                    icon: Icon(Icons.add),
                    label: Text('Add Students'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Room newRoom = UseRoomCubit().activeRoom(context, room);
                      acticeRoom(context, newRoom);
                    },
                    icon: Icon(Icons.play_arrow),
                    label: Text('Start Class'),
                  ),
                ],
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
