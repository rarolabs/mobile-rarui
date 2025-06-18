import 'package:flutter/material.dart';

abstract class QBoxShadow {
  static BoxShadow cardIconBoxShadow = const BoxShadow(
    color: Color.fromRGBO(141, 141, 141, 0.3),
    offset: Offset(2, 2),
    blurRadius: 8,
    spreadRadius: 0,
  );
}
