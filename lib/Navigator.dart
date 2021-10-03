import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/page/ActiceRoom.dart';
import 'package:cubitroom/page/RoomPage.dart';
import 'package:cubitroom/page/StudentsDetailsPage.dart';
import 'package:cubitroom/page/TeacherPage.dart';
import 'package:cubitroom/page/TeacherdetailsPage.dart';
import 'package:flutter/material.dart';

import '../page/RoomsPage.dart';
import '../page/StudentPage.dart';
import 'cubit/teacher/teacher_cubit.dart';

Widget studentAction(context, {bool raplace = true}) => IconButton(
      icon: Icon(Icons.people),
      onPressed: () {
        pushOrReplace(context, raplace, StudentPage());
      },
    );

Widget roomsAction(context, {bool raplace = true}) => IconButton(
      icon: Icon(Icons.class__outlined),
      onPressed: () {
        pushOrReplace(context, raplace, RoomsPage());
      },
    );

void roomPage(context, Room room,
    {bool isManager = false, bool raplace = false}) {
  pushOrReplace(context, raplace, RoomPage(room: room, isManager: isManager));
}

void acticeRoom(context, Room room, {bool raplace = false}) {
  pushOrReplace(context, raplace, ActiveRoomWidget(room: room));
}

void roomsPage(context, {bool raplace = false}) {
  pushOrReplace(context, raplace, RoomsPage());
}

void studentPage(BuildContext context, {bool raplace = false}) {
  pushOrReplace(context, raplace, StudentPage());
}

void teacherPage(BuildContext context, {bool raplace = false}) {
  pushOrReplace(context, raplace, TeacherPage());
}

void studentsDetailsPage(context, Student student, {bool raplace = false}) {
  pushOrReplace(context, raplace, StudentsDetailsPage(student: student));
}

void teachersDetailsPage(context, Teacher teacher, {bool raplace = false}) {
  pushOrReplace(context, raplace, TeacherDetailsPage(teacher: teacher));
}

void pushOrReplace(context, bool raplace, page) {
  var route = MaterialPageRoute(builder: (context) => page);

  raplace
      ? Navigator.of(context).pushReplacement(route)
      : Navigator.of(context).push(route);
}
