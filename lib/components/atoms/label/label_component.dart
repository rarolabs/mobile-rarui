import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../utils/extensions/string_extension.dart';
import 'label_specs.dart';
import 'label_style.dart';

class LabelComponent extends StatelessWidget with Component<LabelStyle, LabelSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilos do componente
  final LabelStyleSet styles;

  /// Texto do widget
  final String? text;

  /// Alinhamento do texto do widget
  final TextAlign? textAlign;

  /// Texto que ultrapassa o limite do widget
  final TextOverflow? textOverflow;

  /// Direção do texto do widget
  final TextDirection? textDirection;

  /// Número de linhas máximas de texto do widget
  final int? maxLines;

  /// Controla o menor tamanho possível para o text
  final double? minFontSize;

  /// Utilizado para agrupar textos na mesma tela para ficarem com o mesmo tamanho e estilo
  final AutoSizeGroup? group;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const LabelComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.text,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.clip,
    this.textDirection = TextDirection.ltr,
    this.maxLines,
    this.minFontSize,
    this.group,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<LabelStyle, LabelSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
      error: styles.specs.error,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    LabelStyle style,
    LabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenRegular(
    LabelStyle style,
    LabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Semantics(
        label: labelSemantics,
        hint: hintSemantics,
        child: AutoSizeText.rich(
          (text ?? '').toBoldTextSpan(style.textStyle, highlightColor: style.highlightColor),
          style: style.textStyle,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: textOverflow,
          textDirection: textDirection,
          minFontSize: minFontSize ?? QSizes.x12,
          group: group,
        ),
      );

  @override
  Widget whenDisabled(
    LabelStyle style,
    LabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Semantics(
        label: labelSemantics,
        hint: hintSemantics,
        child: AutoSizeText.rich(
          (text ?? '').toBoldTextSpan(style.textStyle, highlightColor: style.highlightColor),
          style: style.textStyle,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: textOverflow,
          textDirection: textDirection,
          minFontSize: minFontSize ?? QSizes.x12,
          group: group,
        ),
      );

  @override
  Widget whenError(
    LabelStyle style,
    LabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      Semantics(
        label: labelSemantics,
        hint: hintSemantics,
        child: AutoSizeText.rich(
          (text ?? '').toBoldTextSpan(style.textStyle, highlightColor: style.highlightColor),
          style: style.textStyle,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: textOverflow,
          textDirection: textDirection,
          minFontSize: minFontSize ?? QSizes.x12,
          group: group,
        ),
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
      };
}
