import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/room/room_cubit.dart';
import 'cubit/student/student_cubit.dart';
import 'cubit/teacher/teacher_cubit.dart';
import 'page/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentCubit>(
          create: (context) => StudentCubit(),
        ),
        BlocProvider<TeacherCubit>(
          create: (context) => TeacherCubit(),
        ),
        BlocProvider<RoomCubit>(
          create: (context) => RoomCubit(),
        ),
      ],
      child: _buildWithTheme(context),
    );
  }

  Widget _buildWithTheme(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
