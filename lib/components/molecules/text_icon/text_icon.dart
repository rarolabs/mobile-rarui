import 'text_icon_specs.dart';
import 'text_icon_style_set.dart';

class QTextIcon extends TextIconSpecs {
  /// Style configuration for [QTextIcon]
  final TextIconStyleSet style;

  const QTextIcon({
    required this.style,
    super.key,
    required super.behaviour,
    required super.title,
    required super.leadingIconPath,
    super.subtitle,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  /// Representa o componente principal, um ícone e um texto na cor Gray5Bold
  const QTextIcon.standard({
    super.key,
    required super.title,
    required super.behaviour,
    required super.leadingIconPath,
    super.subtitle,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = TextIconStyleSet.standard,
        super(styles: TextIconStyleSet.standard);

  /// Representa o componente com ícone na cor ciano e texto na cor Gray4Regular
  const QTextIcon.body16IconCiano({
    super.key,
    required super.title,
    required super.behaviour,
    required super.leadingIconPath,
    super.subtitle,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = TextIconStyleSet.body16IconCiano,
        super(styles: TextIconStyleSet.body16IconCiano);

  /// Representa o componente principal, um ícone e um texto na cor Gray5Bold
  const QTextIcon.withSubtitle({
    super.key,
    required super.title,
    required super.behaviour,
    super.subtitle,
    super.leadingIconPath,
    super.trailingIconPath,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = TextIconStyleSet.standard,
        super(styles: TextIconStyleSet.standard);

  /// Representa o componente principal, um ícone e um texto na cor Secondary
  const QTextIcon.secondaryStyle({
    super.key,
    required super.title,
    required super.behaviour,
    super.subtitle,
    super.leadingIconPath,
    super.trailingIconPath,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = TextIconStyleSet.body16IconSecondary,
        super(styles: TextIconStyleSet.body16IconSecondary);

  /// Representa o componente principal, um ícone e um texto negrito na cor Secondary
  const QTextIcon.boldSecondary({
    super.key,
    required super.title,
    required super.behaviour,
    super.subtitle,
    super.leadingIconPath,
    super.trailingIconPath,
    super.hintSemantics,
    super.labelSemantics,
    bool defaultColor = true,
  })  : style = defaultColor ? TextIconStyleSet.body14 : TextIconStyleSet.body14BoldSecondary,
        super(styles: defaultColor ? TextIconStyleSet.body14 : TextIconStyleSet.body14BoldSecondary);
}
