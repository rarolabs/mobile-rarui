import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import 'divider_specs.dart';
import 'divider_style.dart';

class DividerComponent extends StatelessWidget with Component<DividerStyle, DividerSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Estilo do componente
  final DividerStyleSet styles;

  // Texto de acessibilidade
  final String? labelSemantics;

  // Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const DividerComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<DividerStyle, DividerSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    DividerStyle style,
    DividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    DividerStyle style,
    DividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: Divider(
        color: style.color,
        thickness: style.thickness,
        height: style.height,
      ),
    );
  }

  @override
  Widget whenDisabled(
    DividerStyle style,
    DividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: Divider(
        color: style.color,
        thickness: style.thickness,
        height: style.height,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}
