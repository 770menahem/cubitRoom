import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:cubitroom/widget/form/Dropdown.dart';
import 'package:cubitroom/widget/form/Input.dart';
import 'package:cubitroom/widget/lang/en.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const.dart';
import '../SnackBar.dart';

addRoomDialog(BuildContext context) {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  Teacher? teacher;
  String longRoom = '1';
  List<String> longOptions = [
    '0.5',
    '1',
    '1.5',
    '2',
    '2.5',
    '3',
    '3.5',
    '4',
  ];

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
                validate: (String? value) => value != null && value.isNotEmpty
                    ? null
                    : lang[txt.fullName],
              ),
              BlocBuilder<TeacherCubit, TeacherState>(
                builder: (context, state) {
                  if (state.teachers.length == 0) {
                    return Text('0 teachers asign');
                  } else {
                    teacher = state.teachers[0];
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Dropdown(
                          title: 'Teacher',
                          value: '${teacher!.id}: ${teacher!.name}',
                          listOption: state.teachers
                              .map((te) => '${te.id}: ${te.name}')
                              .toList(),
                          handleChange: (t) {
                            setState(
                              () {
                                teacher = state.teachers.firstWhere(
                                    (te) => '${te.id}: ${te.name}' == t);
                              },
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
              StatefulBuilder(
                builder: (context, setState) => Dropdown(
                  title: lang[txt.longMeating],
                  value: longRoom,
                  listOption: longOptions,
                  handleChange: (t) => setState(() => longRoom = t),
                ),
              )
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
              if (key.currentState!.validate() && teacher != null) {
                Room room = Room(
                  students: [],
                  teacher: teacher!,
                  name: nameController.text,
                  long: double.parse(longRoom),
                );
                UseRoomCubit().add(context, room);

                Navigator.of(context).pop();
                snackBar(context, lang[txt.roomAdded]);
              }
            },
          ),
        ],
      );
    },
  );
}
