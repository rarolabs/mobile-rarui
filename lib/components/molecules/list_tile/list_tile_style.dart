import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/divider/divider_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import '../../atoms/toggle/toggle_specs.dart';

class QListTileSharedStyle {
  final LoadingStyle loadingStyle;
  final DividerStyleSet dividerStyleSet;

  final LabelStyleSet titleStyle;
  final LabelStyleSet? statusStyle;
  final LabelStyleSet subtitleStyle;
  final LabelStyleSet trailingLabelStyle;
  final ToggleStyleSet? trailingToggleStyle;

  QListTileSharedStyle({
    required this.loadingStyle,
    required this.dividerStyleSet,
    required this.titleStyle,
    this.statusStyle,
    required this.subtitleStyle,
    required this.trailingLabelStyle,
    this.trailingToggleStyle,
  });
}

class QListTileStyle {
  /// Cor do background
  final Color activeColor;

  /// Espaçamento entre o leadingIcon e o título
  final double? space;

  /// Centraliza na vertical os Widgets:  title, subTitle,leadingIcon e trailingIcon.
  final bool centralized;

  /// Estilo do leadingIcon
  final IconStyleSet? leadingIconStyle;

  /// Estilo do trailingIcon
  final IconStyleSet? trailingIconStyle;

  /// Espaçamento vertical do componente
  final double verticalPadding;

  /// Espaço entre título e subtítulo
  final double? spaceBetweenTexts;

  /// Adiciona um espaço entre o trailingIcon e o trailingLabel
  final double addSpaceBetweenTrailingIconAndLabel;

  QListTileStyle({
    this.activeColor = Colors.transparent,
    this.space,
    this.centralized = true,
    required this.leadingIconStyle,
    required this.trailingIconStyle,
    required this.verticalPadding,
    this.spaceBetweenTexts,
    this.addSpaceBetweenTrailingIconAndLabel = 0,
  });
}

class QListTileStyles {
  final QListTileSharedStyle shared;
  final QListTileStyle regular;
  final QListTileStyle disabled;

  QListTileStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
