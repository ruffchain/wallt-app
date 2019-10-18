import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _padding = EdgeInsets.symmetric(vertical: 10);

Widget myPrimaryButton(String text,
    {VoidCallback onPressed, EdgeInsetsGeometry padding = _padding}) {
  return RaisedButton(
    color: Color(0xff07C8CA),
    highlightColor: Colors.cyanAccent[700],
    colorBrightness: Brightness.dark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    padding: padding,
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 14),
    ),
  );
}

Widget mySecondaryButton(String text,
    {VoidCallback onPressed, EdgeInsetsGeometry padding = _padding}) {
  return RaisedButton(
    color: Colors.grey,
    highlightColor: Colors.grey[700],
    colorBrightness: Brightness.dark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    padding: padding,
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 14),
    ),
  );
}
