import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'toast_component.dart';
import 'toast_specs.dart';

class QToast extends ToastSpecs {
  const QToast.gray4White({
    super.key,
    required super.behaviour,
    required super.title,
    super.pathTrailingIcon,
  }) : super(styles: ToastStyleSet.gray4White);

  Future<void> show(BuildContext context) async {
    showToastWidget(
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      ToastComponent(
        behaviour: behaviour,
        styles: styles,
        title: title,
        pathTrailingIcon: pathTrailingIcon,
      ),
    );
  }
}
