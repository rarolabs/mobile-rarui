import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/box_shadow.dart';
import '../../../theme/sizes.dart';
import '../../atoms/atoms.dart';
import 'card_cashback_category_style.dart';

class CardCashbackCategoryComponent extends StatelessWidget
    with Component<CardCashbackCategoryStyle, CardCashbackCategorySharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CardCashbackCategoryStyles styles;

  /// Texto do botão
  final QLabel labelButton;

  /// Caminho do Icone
  final String svgBase64;

  /// Callback caso o card tenha função
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  CardCashbackCategoryComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.labelButton,
    required this.svgBase64,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardCashbackCategoryStyle, CardCashbackCategorySharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardCashbackCategoryStyle style,
    CardCashbackCategorySharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardCashbackCategoryStyle style,
    CardCashbackCategorySharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        labelButton: labelButton,
        svgBase64: svgBase64,
        onPressed: onPressed,
        style: style,
      ),
    );
  }

  @override
  Widget whenDisabled(
    CardCashbackCategoryStyle style,
    CardCashbackCategorySharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        labelButton: labelButton,
        svgBase64: svgBase64,
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
    required this.svgBase64,
    this.onPressed,
    required this.style,
  });

  final Behaviour behaviour;

  final QLabel labelButton;

  final String svgBase64;

  final VoidCallback? onPressed;

  final CardCashbackCategoryStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: style.padding,
        width: QSizes.x188,
        height: style.height,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: style.borderRadius,
          boxShadow: [QBoxShadow.cardIconBoxShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QIcon.base64size16Black(behaviour: behaviour, svgPath: svgBase64),
            labelButton,
          ],
        ),
      ),
    );
  }
}
