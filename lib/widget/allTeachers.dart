import 'package:cubitroom/cubit/teacher/teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TeacherCard.dart';

class AllTeachers extends StatelessWidget {
  final Function? filter;
  final Function? onTap;
  const AllTeachers({Key? key, this.filter, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TeacherCubit, TeacherState>(
        builder: (context, state) {
          return Wrap(
            children: [
              ...state.props
                  .where((teach) => filter != null ? filter!(teach) : true)
                  .map(
                    (teach) => TeacherCard(
                      teacher: teach,
                      onTap: () => onTap != null ? onTap!(teach) : null,
                    ),
                  )
                  .toList(),
            ],
          );
        },
      ),
    );
  }
}
