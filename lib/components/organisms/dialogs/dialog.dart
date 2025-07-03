import 'package:flutter/material.dart';

class RDialog {
  static void show({
    required BuildContext context,
    Widget? child,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) {
    final dialog = Dialog(
      backgroundColor: backgroundColor,
      child: child,
      shape: shape,
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
