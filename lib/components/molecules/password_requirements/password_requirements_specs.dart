import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'password_requirements_component.dart';
import 'password_requirements_style.dart';

part 'password_requirements_style_set.dart';

class PasswordRequirementsSpecs extends PasswordRequirementsComponent {
  PasswordRequirementsSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.headInfoText,
    required super.requirements,
    required super.passwordController,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Usado para inputs padrões de dinheiro
  static PasswordRequirementsStyles standardStyle() {
    return PasswordRequirementsStyles(
      regular: PasswordRequirementsStyle(),
      shared: PasswordRequirementsSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x12),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
    );
  }
}
