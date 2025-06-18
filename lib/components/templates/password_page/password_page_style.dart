import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../atoms/pin_input/pin_input_specs.dart';
import '../../molecules/button/button_specs.dart';

class PasswordPageSharedStyle {
  final LoadingStyle textLoadingStyle;
  final LabelStyleSet titleStyle;
  final TextAlign titleTextAlign;
  final LabelStyleSet bodyStyle;
  final ButtonStyleSet tertiaryButtonStyle;
  final ButtonStyleSet primaryButtonStyle;
  final ButtonStyleSet secondaryButtonStyle;
  final PinInputStyleSet pinInputStyle;
  final int pinInputLength;

  const PasswordPageSharedStyle({
    required this.textLoadingStyle,
    this.titleTextAlign = TextAlign.left,
    this.titleStyle = LabelStyleSet.h5Lato20Gray5Bold,
    this.pinInputStyle = PinInputStyleSet.h2Lato32Bold,
    this.bodyStyle = LabelStyleSet.captionRoboto14Gray4Regular,
    this.tertiaryButtonStyle = ButtonStyleSet.tertiaryPrimaryBase,
    this.primaryButtonStyle = ButtonStyleSet.primaryBase,
    this.secondaryButtonStyle = ButtonStyleSet.secondaryBase,
    this.pinInputLength = 6,
  });
}

class PasswordPageStyle {
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;

  const PasswordPageStyle({
    this.crossAxisAlignment,
    this.textAlign,
  });
}

class PasswordPageStyles {
  final PasswordPageSharedStyle shared;
  final PasswordPageStyle regular;

  const PasswordPageStyles({
    required this.shared,
    required this.regular,
  });
}
