import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Navigator.dart';
import 'AllStudents.dart';

class AddStudentToClass extends StatelessWidget {
  final Room room;
  const AddStudentToClass({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Students'),
        AllStudents(
          filter: (Student student) => room.isExsist(student.id) == null,
          onTap: (Student student) =>
              UseRoomCubit().addToRoom(context, student, room.id),
        ),
        TextButton.icon(
          onPressed: () => studentPage(context),
          icon: Icon(Icons.people),
          label: Text('students Page'),
        ),
      ],
    );
  }
}
