import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import 'state_fail_page_component.dart';
import 'state_fail_page_style.dart';

part 'state_fail_page_style_set.dart';

class StateFailPageSpecs extends StateFailPageComponent {
  const StateFailPageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.appBarTitle,
    required super.buttonText,
    required super.onButtonPressed,
    required super.appBarIconTap,
    super.description,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Usado para estado de Falha
  static StateFailPageStyles get standard {
    return StateFailPageStyles(
      regular: StateFailPageStyle(
        buttonStyle: ButtonStyleSet.tertiaryCiano,
        titleStyle: LabelStyleSet.h5Roboto20Gray8Bold,
        descriptionStyle: LabelStyleSet.bodyRoboto20Gray8Regular,
      ),
      shared: StateFailPageSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }
}
