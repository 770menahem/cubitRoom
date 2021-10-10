import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final Color color;

  const MyTitle({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.008),
      width: size.width,
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
