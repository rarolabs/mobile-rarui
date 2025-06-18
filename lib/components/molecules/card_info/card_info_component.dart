import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import 'card_info_specs.dart';
import 'card_info_styles.dart';

class CardInfoComponent extends StatelessWidget
    with Component<CardInfoStyle, CardInfoSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CardInfoStyleSet styles;

  /// URL da skin do cartão
  final String cardSkinURL;

  /// Título do componente - Comumente será o nome do cliente
  final String? title;

  /// Subtítulo do componente - Coumnete será os números finais do cartão
  final String? subtitle;

  /// Texto para acessibilidade
  final String? textSemantics;

  /// Define se o card deve ser renderizado na vertical
  final bool? isVertical;

  const CardInfoComponent({
    required this.behaviour,
    required this.styles,
    required this.cardSkinURL,
    this.title,
    this.subtitle,
    this.textSemantics,
    this.isVertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      loading: styles.specs.shared.loadingStyle,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardInfoStyle style,
    CardInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardInfoStyle style,
    CardInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BaseCardInfo(
      behaviour: behaviour,
      style: style,
      sharedStyle: otherStyle,
      cardSkinURL: cardSkinURL,
      title: title,
      subtitle: subtitle,
      textSemantics: textSemantics,
      isVertical: isVertical,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _BaseCardInfo extends StatelessWidget {
  final Behaviour behaviour;
  final CardInfoStyle style;
  final CardInfoSharedStyle sharedStyle;
  final String cardSkinURL;
  final String? title;
  final String? subtitle;
  final String? textSemantics;
  final bool? isVertical;

  const _BaseCardInfo({
    required this.behaviour,
    required this.style,
    required this.sharedStyle,
    required this.cardSkinURL,
    this.title,
    this.subtitle,
    this.textSemantics,
    this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: textSemantics,
      child: Stack(
        children: [
          QImage(
            style: sharedStyle.imageStyleSet,
            behaviour: behaviour,
            path: cardSkinURL,
            errorWidget: QImage(
              behaviour: behaviour,
              path: isVertical != null && isVertical!
                  ? QTheme.svgs.cardStandardSkinVertical
                  : QTheme.svgs.cardStandardSkin,
              style: sharedStyle.imageStyleSet,
            ),
          ),
          if (title != null || subtitle != null)
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.03,
              left: isVertical != null && isVertical!
                  ? MediaQuery.sizeOf(context).width * 0.015
                  : MediaQuery.sizeOf(context).height * 0.045,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    QLabel(
                      style: sharedStyle.titleStyle,
                      behaviour: behaviour,
                      text: title,
                    ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: QSizes.x4),
                      child: QLabel(
                        style: sharedStyle.subtitleStyle,
                        behaviour: behaviour,
                        text: subtitle,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
