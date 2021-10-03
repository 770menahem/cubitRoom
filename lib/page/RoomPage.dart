import 'package:cubitroom/cubit/room/room_cubit.dart';
import 'package:cubitroom/widget/ActiveRoomCard.dart';
import 'package:cubitroom/widget/AddStudentToClass.dart';
import 'package:cubitroom/widget/allRelatedClases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Navigator.dart';

class RoomPage extends StatelessWidget {
  final Room room;
  final bool isManager;
  const RoomPage({
    Key? key,
    required this.room,
    this.isManager = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${room.name}: ${isManager ? 'manger' : 'active'}'),
        actions: <Widget>[
          studentAction(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(8),
            child: BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AcctiveRoomCard(room: room, isManager: isManager),
                    isManager
                        ? AddStudentToClass(room: room)
                        : AllRelatedClasses(room: room),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
