import 'dart:convert';

import 'package:cubitroom/const.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherState(teachers: [Teacher(name: 'as')]));

  addTeacher(Teacher teacher) => emit(
        TeacherState(teachers: state.teachers..add(teacher)),
      );

  removeStudent(int id) => emit(
        TeacherState(teachers: state.teachers..removeWhere((s) => s.id == id)),
      );
}

class UseTeacherCubit {
  void add(BuildContext context, Teacher teacher) {
    BlocProvider.of<TeacherCubit>(context).addTeacher(teacher);
  }

  void remove(BuildContext context, Teacher teacher) {
    BlocProvider.of<TeacherCubit>(context).removeStudent(teacher.id);
  }
}
