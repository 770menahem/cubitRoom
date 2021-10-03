import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;
  final Function onTap;

  const TeacherCard({
    Key? key,
    required this.teacher,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            elevation: 5,
            color: Colors.green,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.school),
                  Text(teacher.id.toString()),
                  Text('Name: ' + teacher.name),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
