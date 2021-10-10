import 'package:cubitroom/widget/form/MyTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Icon icon;
  final int minLine;
  final String? Function(String?)? validate;

  const Input({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.validate,
    this.minLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTitle(title: title, color: Colors.grey),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextFormField(
                  controller: controller,
                  autofocus: true,
                  maxLines: null,
                  minLines: this.minLine,
                  validator: validate,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
