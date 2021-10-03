import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/TeacherCard.dart';
import 'package:cubitroom/widget/TeacherDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';
import '../const.dart';

class TeacherDetailsPage extends StatelessWidget {
  final Teacher teacher;
  const TeacherDetailsPage({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teacher.name),
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
                      TeacherCard(teacher: teacher, onTap: () {}),
                      BlocBuilder<RoomCubit, RoomState>(
                          builder: (context, state) {
                        List<Room> rooms = findTeachersRoom(
                          state.rooms,
                          teacher.id,
                        );

                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: SingleChildScrollView(
                            child: TeacherDetails(
                              rooms: rooms,
                              teacher: teacher,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                // CloseButton(onPressed: () => useRemoveStudent(context, teacher))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
