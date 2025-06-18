import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'textformfield_component.dart';
import 'textformfield_style.dart';

class TextformfieldSpecs extends TextformfieldComponent {
  const TextformfieldSpecs({
    super.key,
    required super.styles,
    required super.behaviour,
    super.hint,
    super.fieldState,
    super.controller,
    super.label,
    super.onChanged,
    super.onFieldSubmitted,
    super.onEditingComplete,
    super.validator,
    super.inputFormatters,
    super.focusNode,
    super.keyboardType,
    super.onPrefixIconPressed,
    super.onSuffixIconPressed,
    super.maxLength,
    super.initialValue,
    super.helperText,
    super.errorText,
    super.hasHelperIcon,
    super.tooltipMessage,
    super.isPassword,
    super.hasPrefixIcon,
    super.hasSuffixIcon,
    super.prefixIconSvgPath,
    super.suffixIconSvgPath,
    super.onHelperIconPressed,
    super.scrollPadding,
    super.readOnly,
    super.onTap,
    super.textCapitalization,
  });

  static QTextformfieldStyles get _textformfieldDefaultStyle => QTextformfieldStyles(
        shared: QTextformfieldSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(QSizes.x300, QSizes.x44),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
        regular: QTextformfieldStyle(
          cursorColor: QTheme.colors.gray5,
          textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray5),
          hintStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
            color: QTheme.colors.gray3,
          ),
          errorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.errorColorBase,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.gray3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.primaryColorBase,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.errorColorBase,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.errorColorBase,
            ),
          ),
          warningBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.warningColorBase,
            ),
          ),
          successBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(
              color: QTheme.colors.successColorBase,
            ),
          ),
          helperErrorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.errorColorBase,
          ),
          helperRegularStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.gray3,
          ),
          helperSuccessStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.successColorBase,
          ),
          helperWarningStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.warningColorBase,
          ),
        ),
        disabled: QTextformfieldStyle(
          hintStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
            color: QTheme.colors.gray3,
          ),
          errorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
            color: QTheme.colors.gray3,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: QTheme.colors.gray3),
            borderRadius: BorderRadius.circular(QSizes.x8),
          ),
        ),
      );

  static QTextformfieldStyles get standardStyle {
    final baseStyle = _textformfieldDefaultStyle;

    return QTextformfieldStyles(
      shared: baseStyle.shared,
      disabled: baseStyle.disabled,
      regular: baseStyle.regular,
    );
  }

  static QTextformfieldStyles get passwordStyle {
    final baseStyle = _textformfieldDefaultStyle;

    return QTextformfieldStyles(
      shared: baseStyle.shared,
      disabled: baseStyle.disabled,
      regular: baseStyle.regular.copyWith(
        cursorColor: QTheme.colors.gray5,
        hintStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
        suffixIconStyle: IconStyleSet.size24Gray3,
      ),
    );
  }

  static QTextformfieldStyles get searchStyle {
    final baseStyle = _textformfieldDefaultStyle;

    return QTextformfieldStyles(
      shared: baseStyle.shared,
      disabled: baseStyle.disabled,
      regular: baseStyle.regular.copyWith(
        labelStyle: LabelStyleSet.captionRoboto12PrimaryBold,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: QSizes.x4,
          vertical: QSizes.x4,
        ),
        borderColorLabel: QTheme.colors.gray2,
      ),
    );
  }

  static QTextformfieldStyles get sufixIconStyle {
    final baseStyle = standardStyle;

    return QTextformfieldStyles(
      shared: baseStyle.shared,
      disabled: baseStyle.disabled,
      regular: baseStyle.regular.copyWith(
        suffixIconStyle: IconStyleSet.size12Gray3,
      ),
    );
  }
}
