import 'package:flutter/material.dart';

class RDialogFullscreen {
  static void show({
    required BuildContext context,
    Widget? child,
    Duration? duration,
    Color? backgroundColor,
  }) {
    final dialog = Dialog.fullscreen(
      backgroundColor: backgroundColor,
      child: child,
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
