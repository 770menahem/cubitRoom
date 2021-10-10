import 'package:cubitroom/Navigator.dart';
import 'package:cubitroom/widget/lang/en.dart';
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
          btn(context, Colors.green, lang[txt.roomPage], Icons.class__sharp,
              roomsPage),
          btn(context, Colors.yellow, lang[txt.teacherPage], Icons.school,
              teacherPage),
          btn(context, Colors.orange, lang[txt.studentPage], Icons.people,
              studentPage),
        ],
      ),
    ));
  }
}
