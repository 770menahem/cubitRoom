import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:flutter/material.dart';

class ClassStudentCard extends StatelessWidget {
  final Student student;
  final bool isPresent;
  final Function onTap;

  const ClassStudentCard({
    Key? key,
    required this.student,
    required this.onTap,
    required this.isPresent,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 5,
        color: isPresent ? Colors.green : Colors.red,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(student.name),
              isPresent ? Icon(Icons.account_circle) : Icon(Icons.no_accounts),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;
  final Function onTap;

  const StudentCard({
    Key? key,
    required this.student,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child:
          // BlocBuilder<ThemeappBloc, ThemeappState>(
          //   builder: (BuildContext context, ThemeappState state) =>
          Card(
        elevation: 5,
        color: Color(0xff90caf9),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.28,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Icon(Icons.account_circle),
              Text('name: ' + student.name),
              Text('id: ' + student.id.toString()),
              // BlocBuilder<RoomBloc, RoomState>(builder: (context, state) {
              //   int calssNum = findStudentsRoom(
              //     (state as RoomInitial).rooms,
              //     student.id,
              //   ).length;

              //   return Text('Sign in to $calssNum');
              // })
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

class StudentInList extends StatelessWidget {
  final Student student;
  final Function onTap;

  const StudentInList({
    Key? key,
    required this.student,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.all(8),
          child: Text(
            student.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
