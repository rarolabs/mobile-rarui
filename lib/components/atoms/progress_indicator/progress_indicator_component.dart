import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import 'progress_indicator_specs.dart';
import 'progress_indicator_style.dart';

class ProgressIndicatorComponent extends StatelessWidget
    with Component<ProgressIndicatorStyle, ProgressIndicatorSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Valor do progresso
  final double progress;

  // Estilo do componente
  final ProgressIndicatorStyleSet styles;

  // Texto de acessibilidade
  final String? labelSemantics;

  // Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const ProgressIndicatorComponent({
    super.key,
    required this.behaviour,
    required this.progress,
    required this.styles,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<ProgressIndicatorStyle, ProgressIndicatorSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    ProgressIndicatorStyle style,
    ProgressIndicatorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    ProgressIndicatorStyle style,
    ProgressIndicatorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: LinearProgressIndicator(
        value: progress,
        color: style.progressColor,
        backgroundColor: style.backgroundColor ?? Colors.transparent,
        minHeight: style.height,
      ),
    );
  }

  @override
  Widget whenDisabled(
    ProgressIndicatorStyle style,
    ProgressIndicatorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: LinearProgressIndicator(
        value: progress,
        color: style.progressColor,
        backgroundColor: style.backgroundColor,
        minHeight: style.height,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}
