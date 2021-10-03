import 'package:cubitroom/cubit/student/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StudentCard.dart';

class AllStudents extends StatelessWidget {
  final Function? filter;
  final Function? onTap;
  const AllStudents({Key? key, this.filter, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  ...state.props
                      .where(
                          (element) => filter != null ? filter!(element) : true)
                      .map(
                        (student) => StudentCard(
                          student: student,
                          onTap: () => onTap != null ? onTap!(student) : null,
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
