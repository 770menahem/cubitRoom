import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DateTimeOutput.dart';

class TimeSelect extends StatelessWidget {
  final Function selectTime;
  final TimeOfDay time;
  final String title;
  final bool isStart;

  const TimeSelect({
    Key? key,
    required this.selectTime,
    required this.time,
    required this.title,
    required this.isStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Text(title),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: ListTile(
              leading: Icon(Icons.timelapse),
              title: TextButton(
                onPressed: () => selectTime(context, time, isStart),
                child: DateTimeOutput(
                  toShow: "$time".split('(')[1].split(')')[0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
