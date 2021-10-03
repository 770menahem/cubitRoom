import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/widget/StudentDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';
import '../const.dart';
import '../widget/StudentCard.dart';

class StudentsDetailsPage extends StatelessWidget {
  final Student student;
  const StudentsDetailsPage({Key? key, required this.student})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: <Widget>[studentAction(context), roomsAction(context)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Card(
                  child: Column(
                    children: [
                      StudentCard(student: student, onTap: () {}),
                      BlocBuilder<RoomCubit, RoomState>(
                          builder: (context, state) {
                        List<Room> rooms = findStudentsRoom(
                          state.rooms,
                          student.id,
                        );

                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: SingleChildScrollView(
                            child: StudentDetails(
                              rooms: rooms,
                              student: student,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                CloseButton(
                  onPressed: () => UseStudentCubit().remove(context, student),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
