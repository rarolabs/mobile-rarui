import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'money_input_component.dart';
import 'money_input_style.dart';

part 'money_input_style_set.dart';

class MoneyInputSpecs extends MoneyInputComponent {
  const MoneyInputSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.labelStyle,
    required super.formFieldKey,
    super.accountBalance,
    super.label,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.icon,
    super.onIconTap,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.hintAccountBalanceLabel,
    super.minValue,
    super.maxValue,
    super.errorText,
  });

  /// Usado para inputs padrões de dinheiro
  static MoneyInputStyles get standardStyle {
    return MoneyInputStyles(
      regular: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray5),
        dividerColor: QTheme.colors.gray2,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
      shared: MoneyInputSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray3),
        dividerColor: QTheme.colors.gray3,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12Gray3Regular,
      ),
      error: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.errorColorBase),
        dividerColor: QTheme.colors.errorColorBase,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
    );
  }

  /// Usado para inputs de tranferência de dinheiro
  static MoneyInputStyles get transferenciaStyle {
    return MoneyInputStyles(
      regular: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray5),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.gray2,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
      shared: MoneyInputSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray3),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.gray3,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12Gray3Regular,
      ),
      error: MoneyInputStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.errorColorBase),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.errorColorBase,
        dividerActivedColor: QTheme.colors.primaryColorBase,
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
    );
  }

  /// Usado para inputs de tranferência de dinheiro com o divider na cor [primaryBase]
  static MoneyInputStyles get transferenciaBaseColorStyle {
    return MoneyInputStyles(
      regular: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray5),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.primaryColorBase,
        successBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.primaryColorBase)),
        normalBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.gray2)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.errorColorBase)),
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
      shared: MoneyInputSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray3),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.gray3,
        errorTextStyle: LabelStyleSet.captionRoboto12Gray3Regular,
      ),
      error: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.errorColorBase),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.errorColorBase,
        successBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.primaryColorBase)),
        normalBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.gray2)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.errorColorBase)),
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
    );
  }

  /// Usado para inputs de tranferência de dinheiro com o divider na cor [primaryBase]
  static MoneyInputStyles get withDescriptionInCaption12Gray5Style {
    return MoneyInputStyles(
      regular: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray5),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.primaryColorBase,
        successBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.primaryColorBase)),
        normalBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.gray2)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.errorColorBase)),
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
        hintLabelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
      ),
      shared: MoneyInputSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.gray3),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.gray3,
        errorTextStyle: LabelStyleSet.captionRoboto12Gray3Regular,
      ),
      error: MoneyInputStyle(
        dividerActivedColor: QTheme.colors.primaryColorBase,
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(color: QTheme.colors.errorColorBase),
        dividerWidth: QSizes.x188,
        dividerColor: QTheme.colors.errorColorBase,
        successBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.primaryColorBase)),
        normalBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.gray2)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: QTheme.colors.errorColorBase)),
        errorTextStyle: LabelStyleSet.captionRoboto12ErrorBaseRegular,
      ),
    );
  }
}
