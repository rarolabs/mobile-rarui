import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/box_shadow.dart';
import '../../atoms/atoms.dart';
import 'card_icon_specs.dart';
import 'card_icon_style.dart';

class CardIconComponent extends StatelessWidget with Component<CardIconStyle, CardIconSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CardIconStyleSet styles;

  /// Texto do botão
  final QLabel labelButton;

  /// Caminho do Icone
  final String svgPath;

  /// Callback caso o card tenha função
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  CardIconComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.labelButton,
    required this.svgPath,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardIconStyle, CardIconSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardIconStyle style,
    CardIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardIconStyle style,
    CardIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        labelButton: labelButton,
        svgPath: svgPath,
        onPressed: onPressed,
        style: style,
      ),
    );
  }

  @override
  Widget whenDisabled(
    CardIconStyle style,
    CardIconSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        labelButton: labelButton,
        svgPath: svgPath,
        style: style,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.disabled,
      };
}

class _BasicCardIcon extends StatelessWidget {
  const _BasicCardIcon({
    required this.behaviour,
    required this.labelButton,
    required this.svgPath,
    this.onPressed,
    required this.style,
  });

  final Behaviour behaviour;

  final QLabel labelButton;

  final String svgPath;

  final VoidCallback? onPressed;

  final CardIconStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: style.padding,
        width: style.width,
        height: style.height,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: style.borderRadius,
          boxShadow: [QBoxShadow.cardIconBoxShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QIcon(style: style.iconStyle, behaviour: behaviour, svgPath: svgPath),
            labelButton,
          ],
        ),
      ),
    );
  }
}
