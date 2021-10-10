import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:cubitroom/widget/form/Input.dart';
import 'package:cubitroom/widget/lang/en.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import '../SnackBar.dart';

addStudentDialog(BuildContext context) {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 98),
        content: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Input(
                controller: nameController,
                title: 'enter full name',
                icon: Icon(Icons.people),
                validate: (value) =>
                    value != null && value.isNotEmpty ? null : "הכנס שם",
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              lang[txt.ok],
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              if (key.currentState!.validate()) {
                Student student = Student(name: nameController.text);
                UseStudentCubit().add(context, student);

                Navigator.of(context).pop();
                snackBar(context, 'student added sucssesfuly');
              }
            },
          ),
        ],
      );
    },
  );
}
