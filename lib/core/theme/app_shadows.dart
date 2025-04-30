import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];
  static List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.342),
      blurRadius: 6,
      offset: Offset(0, 0),
    ),
  ];
}
