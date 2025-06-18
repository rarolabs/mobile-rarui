import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/atoms.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button.dart';
import 'card_cashback_info_style.dart';

class CardCashbackInfoComponent extends StatelessWidget
    with Component<CardCashbackInfoStyle, CardCashbackInfoSharedStyle> {
  final Behaviour behaviour;
  final CardCashbackInfoStyles styles;
  final String title;
  final String subtitle;
  final String? footer;
  final String buttonText;
  final VoidCallback? onPressed;
  final String? labelSemantics;
  final String? hintSemantics;
  final ImageProvider? image;
  final bool horizontalAlignment;

  CardCashbackInfoComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.footer,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
    this.image,
    this.horizontalAlignment = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardCashbackInfoStyle, CardCashbackInfoSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardCashbackInfoStyle style,
    CardCashbackInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardCashbackInfoStyle style,
    CardCashbackInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIconButton(
        behaviour: behaviour,
        title: title,
        subtitle: subtitle,
        footer: footer,
        buttonText: buttonText,
        onPressed: onPressed,
        horizontalAlignment: horizontalAlignment,
        style: style,
        otherStyle: otherStyle,
        image: image,
      ),
    );
  }

  @override
  Widget whenDisabled(
    CardCashbackInfoStyle style,
    CardCashbackInfoSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Semantics(
      label: labelSemantics,
      hint: hintSemantics,
      child: _BasicCardIconButton(
        behaviour: behaviour,
        title: title,
        subtitle: subtitle,
        footer: footer,
        buttonText: buttonText,
        style: style,
        otherStyle: otherStyle,
        horizontalAlignment: horizontalAlignment,
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

class _BasicCardIconButton extends StatelessWidget {
  const _BasicCardIconButton({
    required this.behaviour,
    required this.title,
    required this.subtitle,
    required this.footer,
    required this.buttonText,
    this.onPressed,
    required this.style,
    required this.otherStyle,
    required this.horizontalAlignment,
    this.image,
  });

  final Behaviour behaviour;
  final String title;
  final String subtitle;
  final String? footer;
  final String buttonText;
  final VoidCallback? onPressed;
  final CardCashbackInfoStyle style;
  final CardCashbackInfoSharedStyle otherStyle;
  final ImageProvider? image;
  final bool horizontalAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: style.padding,
      height: style.height,
      width: style.width,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        border: Border.all(color: style.borderColor),
        borderRadius: style.borderRadius,
      ),
      child: horizontalAlignment
          ? Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Labels(
                    behaviour,
                    style: style,
                    otherStyle: otherStyle,
                    title: title,
                    subtitle: subtitle,
                    footer: footer,
                    horizontalAlignment: horizontalAlignment,
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _QIcon(style: style, image: image),
                      _QButton(
                        style: style,
                        otherStyle: otherStyle,
                        buttonText: buttonText,
                        onPressed: onPressed,
                        behaviour: behaviour,
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _QIcon(style: style, image: image),
                _Labels(
                  behaviour,
                  style: style,
                  otherStyle: otherStyle,
                  title: title,
                  subtitle: subtitle,
                  footer: footer,
                  horizontalAlignment: horizontalAlignment,
                ),
                SizedBox(height: style.textSpacing * 2),
                _QButton(
                  style: style,
                  otherStyle: otherStyle,
                  buttonText: buttonText,
                  onPressed: onPressed,
                  behaviour: behaviour,
                ),
              ],
            ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels(
    this.behaviour, {
    required this.style,
    required this.otherStyle,
    required this.title,
    required this.subtitle,
    required this.horizontalAlignment,
    this.footer,
  });
  final CardCashbackInfoStyle style;
  final Behaviour behaviour;
  final CardCashbackInfoSharedStyle otherStyle;
  final String title;
  final String subtitle;
  final String? footer;
  final bool horizontalAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: horizontalAlignment ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SizedBox(height: style.textSpacing),
        _QLabel(
          behaviour,
          style: otherStyle.titleStyle,
          text: title,
        ),
        SizedBox(height: style.textSpacing),
        _QLabel(
          behaviour,
          style: otherStyle.subtitleStyle,
          text: subtitle,
        ),
        if (footer != null) ...[
          SizedBox(height: style.textSpacing),
          _QLabel(
            behaviour,
            style: otherStyle.footerStyle,
            text: footer,
          ),
        ],
      ],
    );
  }
}

class _QButton extends StatelessWidget {
  const _QButton({
    required this.style,
    required this.otherStyle,
    required this.buttonText,
    required this.onPressed,
    required this.behaviour,
  });
  final CardCashbackInfoStyle style;
  final CardCashbackInfoSharedStyle otherStyle;
  final String buttonText;
  final VoidCallback? onPressed;
  final Behaviour behaviour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: QButton(
        text: buttonText,
        style: otherStyle.buttonStyleSet,
        behaviour: behaviour,
        onPressed: onPressed,
      ),
    );
  }
}

class _QIcon extends StatelessWidget {
  const _QIcon({
    required this.style,
    required this.image,
  });
  final CardCashbackInfoStyle style;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: style.iconSize,
        width: style.iconSize,
        decoration: BoxDecoration(
          image: image != null ? DecorationImage(image: image!) : null,
          color: QTheme.colors.secondaryColorBase,
          borderRadius: BorderRadius.circular(style.iconSize / 2),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class _QLabel extends StatelessWidget {
  const _QLabel(
    this.behaviour, {
    required this.style,
    required this.text,
  });
  final String? text;
  final LabelStyleSet style;
  final Behaviour behaviour;

  @override
  Widget build(BuildContext context) => QLabel(
        style: style,
        behaviour: behaviour.isError ? Behaviour.regular : behaviour,
        text: text,
        textOverflow: TextOverflow.clip,
        textAlign: TextAlign.start,
      );
}
