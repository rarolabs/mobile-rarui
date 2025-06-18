import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import '../../../theme/sizes.dart';
import '../../atoms/circular_progress/circular_progress.dart';
import '../../atoms/icon/icon.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label.dart';
import 'button_specs.dart';
import 'button_style.dart';

class ButtonComponent extends StatelessWidget with Component<QButtonStyle, QButtonSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final ButtonStyleSet styles;

  ///Texto do botão
  final String? text;

  /// Ação do Botão
  final VoidCallback? onPressed;

  /// Texto de acessibilidade
  final String? buttonSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  /// Path do leadingIcon
  final String? leadingIconPath;

  /// Path do trailingIcon
  final String? trailingIconPath;

  const ButtonComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.text,
    this.onPressed,
    this.buttonSemantics,
    this.hintSemantics,
    this.leadingIconPath,
    this.trailingIconPath,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QButtonStyle, QButtonSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
      processing: styles.specs.processing,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    QButtonStyle style,
    QButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    QButtonStyle style,
    QButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicButton(
      behaviour: behaviour,
      style: style,
      onPressed: onPressed,
      buttonSemantics: buttonSemantics,
      hintSemantics: hintSemantics,
      text: text,
      leadingIconPath: leadingIconPath,
      trailingIconPath: trailingIconPath,
    );
  }

  @override
  Widget whenDisabled(
    QButtonStyle style,
    QButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicButton(
      behaviour: behaviour,
      style: style,
      buttonSemantics: buttonSemantics,
      hintSemantics: hintSemantics,
      text: text,
      leadingIconPath: leadingIconPath,
      trailingIconPath: trailingIconPath,
    );
  }

  @override
  Widget whenProcessing(
    QButtonStyle style,
    QButtonSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicButton(
      behaviour: behaviour,
      style: style,
      buttonSemantics: buttonSemantics,
      hintSemantics: hintSemantics,
      text: text,
      leadingIconPath: leadingIconPath,
      trailingIconPath: trailingIconPath,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
      };
}

class _BasicButton extends StatefulWidget {
  final Behaviour behaviour;

  final QButtonStyle style;

  final String? text;

  final VoidCallback? onPressed;

  final String? buttonSemantics;

  final String? hintSemantics;

  final String? leadingIconPath;

  final String? trailingIconPath;

  const _BasicButton({
    required this.behaviour,
    required this.style,
    this.text,
    this.onPressed,
    this.buttonSemantics,
    this.hintSemantics,
    this.leadingIconPath,
    this.trailingIconPath,
  });

  @override
  State<_BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<_BasicButton> {
  late WidgetStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = WidgetStatesController();
  }

  @override
  void dispose() {
    statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.buttonSemantics,
      hint: widget.hintSemantics,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: widget.style.border,
          borderRadius: widget.style.borderRadius,
        ),
        child: ElevatedButton(
          key: widget.key,
          style: widget.style.buttonStyle,
          onPressed: widget.onPressed,
          statesController: statesController,
          child: widget.behaviour.isProcessing
              ? QCircularProgress(
                  style: widget.style.circularProgressStyle,
                  behaviour: widget.behaviour,
                )
              : widget.leadingIconPath != null || widget.trailingIconPath != null
                  ? ListenableBuilder(
                      listenable: statesController,
                      builder: (context, child) {
                        IconStyleSet? iconStyle;
                        if (statesController.value.contains(WidgetState.pressed)) {
                          iconStyle = widget.style.pressedIconStyleSet ?? widget.style.iconStyleSet;
                        } else {
                          iconStyle = widget.style.iconStyleSet;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.leadingIconPath != null)
                              Padding(
                                padding: const EdgeInsets.only(right: QSizes.x8),
                                child: QIcon(
                                  behaviour: widget.behaviour,
                                  style: iconStyle ?? IconStyleSet.size24White,
                                  svgPath: widget.leadingIconPath!,
                                ),
                              ),
                            _buildLabel(),
                            if (widget.trailingIconPath != null)
                              Padding(
                                padding: const EdgeInsets.only(left: QSizes.x8),
                                child: QIcon(
                                  behaviour: widget.behaviour,
                                  style: iconStyle ?? IconStyleSet.size24White,
                                  svgPath: widget.trailingIconPath!,
                                ),
                              ),
                          ],
                        );
                      },
                    )
                  : _buildLabel(),
        ),
      ),
    );
  }

  Widget _buildLabel() => QLabel(
        behaviour: widget.behaviour.isError ? Behaviour.regular : widget.behaviour,
        style: widget.style.labelStyle,
        text: widget.text,
        maxLines: 1,
      );
}
