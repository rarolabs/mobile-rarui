import 'package:flutter/material.dart';
import 'package:rarui/utils/constants.dart';

class RSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onPressedAction,
    Duration? duration,
    Color? backgroundColor,
    bool showCloseIcon = false,
    Color? closeIconColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      action: actionLabel != null && onPressedAction != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onPressedAction,
            )
          : null,
      duration: duration ?? RConstants.defaultDurationToSnackbars,
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
