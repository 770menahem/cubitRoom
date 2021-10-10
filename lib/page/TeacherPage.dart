import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/allTeachers.dart';
import 'package:cubitroom/widget/dialogs/addTeacherDialog.dart';
import 'package:flutter/material.dart';

import '../Navigator.dart';
import '../const.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers'),
        actions: <Widget>[
          roomsAction(context),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: AllTeachers(
              onTap: (student) {
                teachersDetailsPage(context, student);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: btn(
              context,
              Colors.lightGreen,
              'Add Teacher',
              Icons.add,
              (context) => addTeacherDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}
