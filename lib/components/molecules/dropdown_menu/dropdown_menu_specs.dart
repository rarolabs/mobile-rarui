import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'dropdown_menu_component.dart';
import 'dropdown_menu_style.dart';

part 'dropdown_menu_style_set.dart';

class DropdownMenuSpecs extends DropdownMenuComponent {
  const DropdownMenuSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.labelText,
    required super.onSelected,
    required super.dropdownValue,
    required super.menuItens,
    required super.menuItensLabels,
    super.enableSearch,
    super.svgPathTrailing,
    super.svgPathSelectedTrailing,
  });

  static MenuStyle get _menuStyle => MenuStyle(
        visualDensity: VisualDensity.compact,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: QSizes.x12,
          ),
        ),
        elevation: WidgetStateProperty.all(QSizes.x4),
        fixedSize: WidgetStateProperty.all(
          const Size.fromWidth(
            QSizes.x136,
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: QTheme.colors.gray11,
          ),
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        constraints: const BoxConstraints(
          maxHeight: QSizes.x32,
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.only(
          left: QSizes.x4,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: QSizes.x32,
        ),
        filled: true,
        fillColor: QTheme.colors.gray10,
      );

  static ButtonStyle get _menuItemButtonStyle => ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(
            color: QTheme.colors.black,
            fontSize: QSizes.x12,
          ),
        ),
      );

  /// Estilo de banners
  static DropdownMenuStyles get standardStyle {
    return DropdownMenuStyles(
      regular: DropdownMenuStyle(
        width: QSizes.x136,
        menuStyle: _menuStyle,
        offset: const Offset(
          QSizes.x0,
          QSizes.x4,
        ),
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.black,
        ),
        inputDecorationTheme: _inputDecorationTheme,
        selectedBorderColor: QTheme.colors.primaryColorBase,
        labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        menuItemButtonStyle: _menuItemButtonStyle,
      ),
      shared: DropdownMenuSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: DropdownMenuStyle(
        width: QSizes.x136,
        menuStyle: _menuStyle,
        offset: const Offset(
          QSizes.x0,
          QSizes.x4,
        ),
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray11,
        ),
        inputDecorationTheme: _inputDecorationTheme,
        selectedBorderColor: QTheme.colors.primaryColorBase,
        labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        menuItemButtonStyle: _menuItemButtonStyle,
      ),
    );
  }
}
