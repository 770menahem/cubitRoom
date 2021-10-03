import 'dart:convert';

import 'package:cubitroom/const.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState(students: []));

  addStudent(Student student) => emit(
        StudentState(students: state.students..add(student)),
      );

  removeStudent(int id) => emit(
        StudentState(students: state.students..removeWhere((s) => s.id == id)),
      );
}

class UseStudentCubit {
  void add(BuildContext context, Student student) {
    BlocProvider.of<StudentCubit>(context).addStudent(student);
  }

  void remove(BuildContext context, Student student) {
    BlocProvider.of<StudentCubit>(context).removeStudent(student.id);
  }
}
