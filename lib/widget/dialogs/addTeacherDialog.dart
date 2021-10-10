import 'package:cubitroom/const.dart';
import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/form/Input.dart';
import 'package:cubitroom/widget/lang/en.dart';
import 'package:flutter/material.dart';

import '../SnackBar.dart';

addTeacherDialog(BuildContext context) {
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
                title: lang[txt.fullName],
                icon: Icon(Icons.people),
                validate: (value) => value != null && value.isNotEmpty
                    ? null
                    : lang[txt.fullName],
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
                Teacher teacher = Teacher(name: nameController.text);
                UseTeacherCubit().add(context, teacher);

                Navigator.of(context).pop();
                snackBar(context, lang[txt.addTeacher]);
              }
            },
          ),
        ],
      );
    },
  );
}
