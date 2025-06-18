import 'package:flutter/material.dart';

import '../../../theme/theme_data.dart';
import 'text_click_specs.dart';
import 'text_click_style_set.dart';

class QTextClick extends TextClickSpecs {
  /// Style configuration for [QTextClick]
  final TextClickStyleSet style;

  const QTextClick({
    required this.style,
    super.key,
    required super.behaviour,
    required super.text,
    super.initialValue,
    super.hintSemantics,
    super.labelSemantics,
    super.showCheckbox,
    super.onCheckboxChange,
  }) : super(styles: style);

  /// Representa o componente principal, um ícone e um texto clicável
  const QTextClick.standard({
    super.key,
    required super.text,
    required super.behaviour,
    super.initialValue,
    super.hintSemantics,
    super.labelSemantics,
    super.showCheckbox,
    super.onCheckboxChange,
  })  : style = TextClickStyleSet.standard,
        super(styles: TextClickStyleSet.standard);
}

class QTextClickSpan extends TextSpan {
  /// Texto com estilo de caption roboto 14 regular
  QTextClickSpan.captionRoboto14Regular({
    required super.text,
    List<QTextClickSpan>? children,
    super.recognizer,
  }) : super(
          style: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray4),
          children: children,
        );

  /// Texto com estilo de caption roboto 14 primary bold
  QTextClickSpan.captionRoboto14primaryBold({
    required super.text,
    List<QTextClickSpan>? children,
    super.recognizer,
  }) : super(
          style: QTheme.fonts.captionRoboto14Bold.copyWith(color: QTheme.colors.primaryColorBase),
          children: children,
        );
}
