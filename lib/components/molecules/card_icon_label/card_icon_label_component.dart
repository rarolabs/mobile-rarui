import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/atoms.dart';
import 'card_icon_label_style.dart';

class CardIconLabelComponent extends StatelessWidget with Component<CardIconLabelStyle, CardIconLabelSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final CardIconLabelStyles styles;

  /// Título é o primeiro texto abaixo do Ícone
  final String title;

  /// Subtítulo é o segundo texto abaixo do Ícone
  final String subtitle;

  /// Callback caso o card tenha função
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Image to be displayed instead of initials
  final ImageProvider? image;

  CardIconLabelComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardIconLabelStyle, CardIconLabelSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardIconLabelStyle style,
    CardIconLabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardIconLabelStyle style,
    CardIconLabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        title: title,
        subTitle: subtitle,
        onPressed: onPressed,
        style: style,
        image: image,
      ),
    );
  }

  @override
  Widget whenDisabled(
    CardIconLabelStyle style,
    CardIconLabelSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIcon(
        behaviour: behaviour,
        title: title,
        subTitle: subtitle,
        style: style,
        image: image,
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
    required this.title,
    required this.subTitle,
    this.onPressed,
    required this.style,
    this.image,
  });

  final Behaviour behaviour;
  final String title;
  final String subTitle;
  final VoidCallback? onPressed;
  final CardIconLabelStyle style;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    String getInitials(String title) {
      if (title.isEmpty) return '';
      final words = title.split(' ').where((word) => word.isNotEmpty).toList();
      if (words.isEmpty) return '';

      return words.map((word) => word[0]).take(2).join().toUpperCase();
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: style.padding,
        height: style.height,
        width: style.width,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: style.borderRadius,
          border: Border.all(
            color: style.borderColor,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: style.iconSize,
                width: style.iconSize,
                decoration: BoxDecoration(
                  image: image != null ? DecorationImage(image: image!) : null,
                  color: QTheme.colors.secondaryColorBase,
                  borderRadius: BorderRadius.circular(style.iconSize / 2),
                ),
                alignment: Alignment.center,
                child: image == null
                    ? QLabel(
                        style: style.initialsTitleStyle,
                        behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                        text: getInitials(title),
                      )
                    : null,
              ),
            ),
            SizedBox(height: style.textSpacing),
            QLabel(
              style: style.titleStyle,
              behaviour: behaviour.isError ? Behaviour.regular : behaviour,
              text: title,
              maxLines: 1,
              textOverflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: image != null ? EdgeInsets.only(top: style.textSpacing) : EdgeInsets.zero,
              child: QLabel(
                style: style.subtitleStyle,
                behaviour: behaviour.isError ? Behaviour.regular : behaviour,
                text: subTitle,
                maxLines: 1,
                textOverflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
