import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/icon/icon.dart';
import '../../atoms/label/label.dart';
import '../../atoms/label/label_specs.dart';
import 'text_icon_style.dart';
import 'text_icon_style_set.dart';

class IconTextComponent extends StatelessWidget with Component<TextIconStyle, TextIconSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final TextIconStyleSet styles;

  /// Título do Componente
  final String title;

  /// Subtítulo do Componente
  final String? subtitle;

  /// Caminho do arquivo svg do leading icon
  final String? leadingIconPath;

  /// Caminho do arquivo svg do trailing icon
  final String? trailingIconPath;

  /// Hint de semântica do componente
  final String? hintSemantics;

  /// Label de semântica do componente
  final String? labelSemantics;

  const IconTextComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    this.subtitle,
    this.leadingIconPath,
    this.trailingIconPath,
    this.hintSemantics,
    this.labelSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<TextIconStyle, TextIconSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    TextIconStyle style,
    TextIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenRegular(
    TextIconStyle style,
    TextIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicIconTextRow(
        behaviour: behaviour,
        style: style,
        title: title,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        leadingIconPath: leadingIconPath,
        trailingIconPath: trailingIconPath,
        titleFormat: otherStyle.titleFormat,
        subtitleFormat: otherStyle.subtitleFormat,
        subtitle: subtitle,
      );

  @override
  Widget whenDisabled(
    TextIconStyle style,
    TextIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _BasicIconTextRow(
        behaviour: behaviour,
        style: style,
        title: title,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        leadingIconPath: leadingIconPath,
        trailingIconPath: trailingIconPath,
        titleFormat: otherStyle.titleFormat,
        subtitleFormat: otherStyle.subtitleFormat,
        subtitle: subtitle,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _BasicIconTextRow extends StatelessWidget {
  final Behaviour behaviour;
  final TextIconStyle style;
  final String title;
  final String? subtitle;
  final LabelStyleSet titleFormat;
  final LabelStyleSet subtitleFormat;
  final String? hintSemantics;
  final String? labelSemantics;
  final String? leadingIconPath;
  final String? trailingIconPath;

  const _BasicIconTextRow({
    required this.behaviour,
    required this.style,
    required this.title,
    required this.subtitle,
    required this.titleFormat,
    required this.subtitleFormat,
    required this.leadingIconPath,
    required this.trailingIconPath,
    required this.hintSemantics,
    required this.labelSemantics,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: SizedBox(
        width: style.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIconPath != null)
              Padding(
                padding: style.rightPadding,
                child: QIcon(
                  style: style.iconStyle,
                  behaviour: behaviour,
                  svgPath: leadingIconPath!,
                ),
              ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  QLabel(
                    text: title,
                    behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                    style: titleFormat,
                    textAlign: TextAlign.start,
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: style.topPadding,
                      child: QLabel(
                        text: subtitle,
                        behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                        style: subtitleFormat,
                        textAlign: TextAlign.start,
                      ),
                    ),
                ],
              ),
            ),
            if (trailingIconPath != null)
              Padding(
                padding: style.leftPadding,
                child: QIcon(
                  style: style.iconStyle,
                  behaviour: behaviour,
                  svgPath: trailingIconPath!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
