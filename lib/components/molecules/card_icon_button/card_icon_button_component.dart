import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/atoms.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button.dart';
import 'card_icon_button_style.dart';

class CardIconButtonComponent extends StatelessWidget with Component<CardIconButtonStyle, CardIconButtonSharedStyle> {
  final Behaviour behaviour;
  final CardIconButtonStyles styles;
  final String title;
  final String subtitle;
  final String? footer;
  final String? buttonText;
  final VoidCallback? onPressed;
  final VoidCallback? onButtonPressed;
  final String? labelSemantics;
  final String? hintSemantics;
  final ImageProvider? image;
  final String? svgBase64;
  final bool horizontalAlignment;

  CardIconButtonComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onButtonPressed,
    this.footer,
    this.onPressed,
    this.labelSemantics,
    this.hintSemantics,
    this.image,
    this.svgBase64,
    this.horizontalAlignment = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CardIconButtonStyle, CardIconButtonSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    CardIconButtonStyle style,
    CardIconButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    CardIconButtonStyle style,
    CardIconButtonSharedStyle otherStyle,
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
        onButtonPressed: onButtonPressed,
        horizontalAlignment: horizontalAlignment,
        style: style,
        otherStyle: otherStyle,
        image: image,
        svgBase64: svgBase64,
      ),
    );
  }

  @override
  Widget whenDisabled(
    CardIconButtonStyle style,
    CardIconButtonSharedStyle otherStyle,
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
        onButtonPressed: onButtonPressed,
        style: style,
        otherStyle: otherStyle,
        horizontalAlignment: horizontalAlignment,
        image: image,
        svgBase64: svgBase64,
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
    this.buttonText,
    this.onButtonPressed,
    this.onPressed,
    required this.style,
    required this.otherStyle,
    required this.horizontalAlignment,
    this.image,
    this.svgBase64,
  });

  final Behaviour behaviour;
  final String title;
  final String subtitle;
  final String? footer;
  final String? buttonText;
  final VoidCallback? onPressed;
  final VoidCallback? onButtonPressed;
  final CardIconButtonStyle style;
  final CardIconButtonSharedStyle otherStyle;
  final ImageProvider? image;
  final bool horizontalAlignment;
  final String? svgBase64;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: style.padding,
        height: style.height,
        width: style.width,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          border: Border.all(color: style.borderColor),
          borderRadius: style.borderRadius,
        ),
        child: horizontalAlignment
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: _Labels(
                      behaviour,
                      style: style,
                      otherStyle: otherStyle,
                      title: title,
                      subtitle: subtitle,
                      footer: footer,
                      horizontalAlignment: horizontalAlignment,
                    ),
                  ),
                  const Spacer(),
                  if (svgBase64 != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        right: QSizes.x8,
                      ),
                      child: QIcon.base64size32Black(
                        behaviour: behaviour,
                        svgPath: svgBase64!,
                      ),
                    ),
                  if (image != null) ...[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _Image(style: style, image: image),
                        const SizedBox(
                          height: QSizes.x12,
                        ),
                        if (onButtonPressed != null) ...[
                          _QButton(
                            style: style,
                            otherStyle: otherStyle,
                            buttonText: buttonText ?? '',
                            onPressed: onButtonPressed,
                            behaviour: behaviour,
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Image(style: style, image: image),
                  SizedBox(height: style.textSpacing),
                  _Labels(
                    behaviour,
                    style: style,
                    otherStyle: otherStyle,
                    title: title,
                    subtitle: subtitle,
                    footer: footer,
                    horizontalAlignment: horizontalAlignment,
                  ),
                  if (onButtonPressed != null) ...[
                    SizedBox(height: style.textSpacing * 2),
                    _QButton(
                      style: style,
                      otherStyle: otherStyle,
                      buttonText: buttonText ?? '',
                      onPressed: onButtonPressed,
                      behaviour: behaviour,
                    ),
                  ],
                ],
              ),
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
  final CardIconButtonStyle style;
  final Behaviour behaviour;
  final CardIconButtonSharedStyle otherStyle;
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
        _QLabel(
          behaviour,
          style: otherStyle.titleStyle,
          text: title,
        ),
        const SizedBox(height: QSizes.x16),
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
  final CardIconButtonStyle style;
  final CardIconButtonSharedStyle otherStyle;
  final String buttonText;
  final VoidCallback? onPressed;
  final Behaviour behaviour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: style.buttonWidth,
      height: style.buttonHeight,
      child: QButton(
        text: buttonText,
        style: otherStyle.buttonStyleSet!,
        behaviour: behaviour,
        onPressed: onPressed,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.style,
    required this.image,
  });
  final CardIconButtonStyle style;
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
