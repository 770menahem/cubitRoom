import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/lang/langs.dart';
import 'package:flutter/material.dart';

import 'cubit/room/room_cubit.dart';
import 'cubit/student/student_cubit.dart';

int count = 1;
Map lang = langs['en']!;
Teacher randomTeacher() => Teacher(name: 'dsa${DateTime.now().millisecond}');
Student randomStudent() => Student(name: 'dsa${DateTime.now().millisecond}');

btn(BuildContext context, Color color, String title, IconData icon,
    Function navigation) {
  return GestureDetector(
    onTap: () {
      lang = langs['he']!;
      navigation(context);
    },
    child: Card(
      color: color,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    ),
  );
}

activeRoomExistsInTime(room, r) =>
    room.date != null &&
    isActiveClass(room) &&
    room.name == r.name &&
    room.teacher.id == r.teacher.id;

bool activeRoomExists(r, room) =>
    room.id == r.id &&
    room.teacher.id == r.teacher.id &&
    room != null &&
    r.date == room.date;

List<Room> findStudentsRoom(List<Room> rooms, int studentId) {
  print('f');
  return rooms.where((Room room) {
    try {
      findStudent(room, studentId);
      if (room.date == null) return true;
    } catch (e) {}
    return false;
  }).toList();
}

List<Room> findTeachersRoom(List<Room> rooms, int teacherId) {
  return rooms..where((Room room) => room.teacher.id == teacherId);
}

Teacher? findStudentById(List<Room> rooms, int studentId) {
  Teacher? student;

  rooms.forEach((room) {
    try {
      student = findStudent(room, studentId);
    } catch (e) {}
  });

  return student;
}

findStudent(Room room, int studentId) {
  return room.students.firstWhere((s) => s.id == studentId);
}

isActiveClass(Room room) {
  return room.date!
          .compareTo(DateTime.now().add(Duration(hours: -room.long.ceil()))) >=
      0;
}
