import 'package:cubitroom/Navigator.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btn(context, Colors.green, 'classes', Icons.class__sharp, roomsPage),
          btn(context, Colors.yellow, 'Teachers', Icons.school, teacherPage),
          btn(context, Colors.orange, 'Students', Icons.people, studentPage),
        ],
      ),
    ));
  }
}
