import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../form/DateTimeOutput.dart';

class MyDatePicker extends StatelessWidget {
  final Function selectDate;
  final DateTime selectedDate;
  final String title;

  const MyDatePicker({
    Key? key,
    required this.selectDate,
    required this.selectedDate,
    required this.title,
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
              leading: Icon(Icons.date_range),
              title: TextButton(
                onPressed: () => selectDate(context),
                child: DateTimeOutput(
                  toShow: "${selectedDate.toLocal()}".split(' ')[0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
