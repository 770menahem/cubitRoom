import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String title;
  String value;
  final List listOption;
  final Function handleChange;

  Dropdown({
    Key? key,
    required this.title,
    required this.value,
    required this.listOption,
    required this.handleChange,
  }) : super(key: key);
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        DropdownButton<String>(
          value: widget.value,
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? newValue) {
            widget.value = newValue ?? widget.value;
            setState(() => widget.handleChange(newValue));
          },
          items: <String>[...widget.listOption]
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList(),
        ),
      ],
    );
  }
}
