import 'package:flutter/material.dart';

Widget actionRow(String name, {GestureTapCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0x20000000),
              width: 0,
            ),
          ),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              name,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black45,
          )
        ],
      ),
    ),
  );
}
