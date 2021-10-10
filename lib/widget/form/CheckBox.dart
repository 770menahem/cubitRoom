import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final List<String> ocationType;
  final List<String> options;
  final String title;
  final Icon icon;
  final Color activeColor;
  final Function handleChange;

  const CheckBox({
    Key? key,
    required this.ocationType,
    required this.options,
    required this.title,
    required this.icon,
    required this.handleChange,
    required this.activeColor,
  }) : super(key: key);

  Widget optionsList() {
    List<Widget> optionsList = [];

    for (var i = 0; i < options.length; i++) {
      optionsList.add(
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: activeColor,
          title: Text(options[i]),
          value: ocationType.contains(options[i]),
          onChanged: (val) {
            handleChange(options[i]);
          },
        ),
      );
    }
    return Column(
      children: optionsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.2, 0, 0, 0),
          child: ListTile(
            title: optionsList(),
          ),
        ),
      ],
    );
  }
}
