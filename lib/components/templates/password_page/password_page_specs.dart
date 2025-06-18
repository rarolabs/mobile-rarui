import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'password_page_component.dart';
import 'password_page_style.dart';

part 'password_page_style_set.dart';

class PasswordPageSpecs extends PasswordPageComponent {
  const PasswordPageSpecs({
    required super.styles,
    super.pinInputBehaviour,
    required super.pinInputController,
    super.pinInputOnCompleted,
    super.pinInputObscureText,
    super.appBarTitle,
    super.backButtonOnPressed,
    super.title,
    super.body,
    super.tertiaryButtonLabel,
    super.tertiaryButtonOnPressed,
    super.tertiaryButtonBehaviour,
    super.primaryButtonLabel,
    super.primaryButtonOnPressed,
    super.primaryButtonBehaviour,
    super.secondaryButtonLabel,
    super.secondaryButtonOnPressed,
    super.secondaryButtonBehaviour,
    super.autofocus,
    super.key,
  });

  ///Variação padrão com o texto alinhado à Esquerda
  static PasswordPageStyles get standardLeftTextStyle {
    return PasswordPageStyles(
      shared: PasswordPageSharedStyle(
        titleTextAlign: TextAlign.left,
        textLoadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const PasswordPageStyle(),
    );
  }

  ///Variação padrão com o texto centralizado
  static PasswordPageStyles get standardCenteredTextStyle {
    return PasswordPageStyles(
      shared: PasswordPageSharedStyle(
        titleTextAlign: TextAlign.center,
        textLoadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const PasswordPageStyle(
        crossAxisAlignment: CrossAxisAlignment.center,
        textAlign: TextAlign.center,
      ),
    );
  }
}
