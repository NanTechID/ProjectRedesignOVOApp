import 'package:flutter/material.dart';

Widget whiteText(
  String text, {
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.white,
    ),
  );
}
