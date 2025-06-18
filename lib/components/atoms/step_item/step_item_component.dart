import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import 'step_item_specs.dart';
import 'step_item_style.dart';

class StepItemComponent extends StatelessWidget
    with Component<StepItemStyle, StepItemSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final StepItemStyleSet styles;

  /// Numero da etapa
  final int stepNumber;

  const StepItemComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<StepItemStyle, StepItemSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  /// Retorna o primeiro dígito do [stepNumber].
  String get firstDigit {
    final text = stepNumber.toString();
    return text.isNotEmpty ? text[0] : '0';
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };

  @override
  Widget whenLoading(
    StepItemStyle style,
    StepItemSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    StepItemStyle style,
    StepItemSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _StepItem(
      height: style.height,
      backgroundColor: style.backgroundColor,
      textColor: style.textColor,
      text: firstDigit,
      isCompleted: style.isCompleted,
    );
  }

  @override
  Widget whenDisabled(
    StepItemStyle style,
    StepItemSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _StepItem(
      height: style.height,
      backgroundColor: style.backgroundColor,
      textColor: style.textColor,
      text: firstDigit,
      isCompleted: style.isCompleted,
    );
  }
}

class _StepItem extends StatelessWidget {
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool isCompleted;

  const _StepItem({
    this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.isCompleted,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height!),
      ),
      child: Visibility(
        visible: !isCompleted,
        replacement: Icon(
          Icons.check,
          color: textColor,
          size: height! * 0.5,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
