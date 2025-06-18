import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class PinInputSharedStyle {
  final LoadingStyle loadingStyle;

  PinInputSharedStyle({
    required this.loadingStyle,
  });
}

class PinInputStyle {
  final TextStyle textStyle;

  PinInputStyle({required this.textStyle});
}

class PinInputStyles {
  final PinInputSharedStyle shared;
  final PinInputStyle regular;
  final PinInputStyle disabled;

  PinInputStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
