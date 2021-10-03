import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/widget/AllStudents.dart';
import 'package:flutter/material.dart';

import '../Navigator.dart';
import '../const.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        actions: <Widget>[
          roomsAction(context),
        ],
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: AllStudents(
              onTap: (student) {
                studentsDetailsPage(context, student);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: btn(
              context,
              Colors.lightGreen,
              'Add Student',
              Icons.add,
              (context) => UseStudentCubit().add(context, randomStudent()),
            ),
          ),
        ],
      ),
    );
  }
}
