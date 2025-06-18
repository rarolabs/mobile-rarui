import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'toast_component.dart';
import 'toast_style.dart';

part 'toast_style_set.dart';

class ToastSpecs extends ToastComponent {
  const ToastSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    super.pathTrailingIcon,
  });

  static ToastStyles get gray4WhiteStyle {
    return ToastStyles(
      shared: ToastSharedStyle(
        titleStyle: LabelStyleSet.bodyRoboto16WhiteRegular,
        iconStyleSet: IconStyleSet.size24White,
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x800),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: ToastStyle(
        backgroundColor: QTheme.colors.gray4,
      ),
    );
  }
}
