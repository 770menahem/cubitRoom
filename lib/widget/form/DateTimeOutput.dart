import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeOutput extends StatelessWidget {
  final String toShow;

  const DateTimeOutput({Key? key, required this.toShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(toShow, style: TextStyle(fontSize: 16, color: Colors.black));
  }
}
