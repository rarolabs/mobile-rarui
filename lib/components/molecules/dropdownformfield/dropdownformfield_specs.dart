import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'dropdownformfield_component.dart';
import 'dropdownformfield_style.dart';

class DropdownformfieldSpecs<T> extends DropdownformfieldComponent {
  const DropdownformfieldSpecs({
    super.key,
    required super.styles,
    required super.behaviour,
    required super.items,
    super.onChanged,
    super.hint,
    super.label,
    super.validator,
    super.focusNode,
    super.initialValue,
    super.helperText,
    super.errorText,
    super.onTap,
  });

  static QDropdownformfieldStyles get _textDropdownformfieldDefaultStyle => QDropdownformfieldStyles(
        shared: QDropdownformfieldSharedStyle(
          loadingStyle: LoadingStyle(
            size: const Size(double.maxFinite, QSizes.x48),
            baseColor: QTheme.colors.gray2,
            highlightColor: QTheme.colors.gray1,
          ),
        ),
        regular: QDropdownformfieldStyle(
          textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray5),
          hintStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
          errorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.gray3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.primaryColorBase),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.errorColorBase),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.errorColorBase),
          ),
          warningBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.warningColorBase),
          ),
          successBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(QSizes.x8),
            borderSide: BorderSide(color: QTheme.colors.successColorBase),
          ),
          helperErrorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
          helperRegularStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.gray3),
          helperSuccessStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.successColorBase),
          helperWarningStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.warningColorBase),
        ),
        disabled: QDropdownformfieldStyle(
          textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
          hintStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
          errorStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.gray3),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: QTheme.colors.gray3),
            borderRadius: BorderRadius.circular(QSizes.x8),
          ),
        ),
      );

  static QDropdownformfieldStyles get standardStyle {
    final baseStyle = _textDropdownformfieldDefaultStyle;

    return QDropdownformfieldStyles(
      shared: baseStyle.shared,
      disabled: baseStyle.disabled,
      regular: baseStyle.regular,
    );
  }
}
