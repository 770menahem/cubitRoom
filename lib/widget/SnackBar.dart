import 'package:cubitroom/const.dart';
import 'package:cubitroom/widget/lang/en.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

snackBar(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: lang[txt.ok],
        onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
      ),
      content: Text(
        msg,
        textDirection: TextDirection.rtl,
      ),
      duration: Duration(seconds: 1),
    ),
  );
}
