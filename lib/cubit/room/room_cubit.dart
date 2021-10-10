import 'package:bloc/bloc.dart';
import 'package:cubitroom/const.dart';
import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomState(rooms: []));

  addToRoom(Student student, int roomId) {
    emit(RoomState(
      rooms: state.rooms
        ..where((r) => r.id == roomId && (r.date == null || isActiveClass(r)))
        ..forEach((r) => r.students.add(student.copyWith())),
    ));
  }

  removeFromRoom(int studentId, int roomId) {
    emit(RoomState(
      rooms: state.rooms
        ..where((r) => r.id == roomId && (r.date == null || isActiveClass(r)))
        ..forEach((r) => r.students.removeWhere((s) => s.id == studentId)),
    ));
  }

  removeFromAllRooms(int studentId) {
    emit(RoomState(
      rooms: state.rooms
        ..forEach(
          (Room room) => room.students.removeWhere((s) => s.id == studentId),
        ),
    ));
  }

  addRoom(Room room) {
    try {
      room = state.rooms.firstWhere(
        (Room r) => activeRoomExistsInTime(r, room),
      );
    } catch (e) {
      room = room.copyWith();
      emit(RoomState(rooms: state.rooms..add(room)));
    }
    return room;
  }

  changeStatus(int roomId, DateTime date, int studentId) {
    emit(RoomState(
        rooms: state.rooms
          ..firstWhere((r) => r.id == roomId && r.date == date)
              .changeStatus(studentId)));
  }
}

class UseRoomCubit {
  addToRoom(context, Student student, int roomId) {
    BlocProvider.of<RoomCubit>(context).addToRoom(student, roomId);
  }

  removeFromRoom(context, int studentId, int roomId) {
    BlocProvider.of<RoomCubit>(context).removeFromRoom(studentId, roomId);
  }

  deleteStudent(context, int studentId) {
    BlocProvider.of<RoomCubit>(context).removeFromAllRooms(studentId);
  }

  add(context, Room room) {
    BlocProvider.of<RoomCubit>(context).addRoom(room);
  }

  activeRoom(context, Room room) {
    Room active = Room(
      id: room.id,
      students: room.students,
      teacher: room.teacher,
      name: room.name,
      date: DateTime.now(),
    );
    return BlocProvider.of<RoomCubit>(context).addRoom(active);
  }

  changeStatus(context, int roomId, DateTime date, int studentId) {
    BlocProvider.of<RoomCubit>(context).changeStatus(roomId, date, studentId);
  }
}
