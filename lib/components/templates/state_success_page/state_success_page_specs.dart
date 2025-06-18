import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import 'state_success_page_component.dart';
import 'state_success_page_style.dart';

part 'state_success_page_style_set.dart';

class StateSuccessPageSpecs extends StateSuccessPageComponent {
  const StateSuccessPageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.buttonText,
    required super.appBarTitle,
    required super.counterText,
    required super.appBarIconTap,
    required super.onButtonPressed,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Usado para feedbacks positivos
  static StateSuccessPageStyles get standard {
    return StateSuccessPageStyles(
      regular: const StateSuccessPageStyle(
        buttonStyle: ButtonStyleSet.tertiaryCiano,
        titleStyle: LabelStyleSet.h5Roboto20Gray8Bold,
        countingStyle: LabelStyleSet.paragraphRoboto16Gray9Regular,
      ),
      shared: StateSuccessPageSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }
}
