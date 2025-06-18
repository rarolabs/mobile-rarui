import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/loading_widget.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/step_divider/step_divider_specs.dart';
import '../../atoms/step_item/step_item_specs.dart';
import 'step_indicator_specs.dart';
import 'step_indicator_style.dart';

class StepIndicatorComponent extends StatelessWidget
    with Component<StepIndicatorStyle, StepIndicatorSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final StepIndicatorStyleSet styles;

  /// Passo atual (ativo). Deve estar entre 1 e totalSteps.
  final int currentStep;

  /// Número total de passos (mínimo 3, máximo 7)
  final int totalSteps;

  const StepIndicatorComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.currentStep,
    required this.totalSteps,
  }) : assert(
          totalSteps >= 3 && totalSteps <= 7,
          'Total steps must be between 3 and 7',
        );

  @override
  Widget build(BuildContext context) {
    final style = Style<StepIndicatorStyle, StepIndicatorSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };

  @override
  Widget whenLoading(
    StepIndicatorStyle style,
    StepIndicatorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    StepIndicatorStyle style,
    StepIndicatorSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    final List<Widget> children = [];

    for (int i = 1; i <= totalSteps; i++) {
      final itemBehaviour = (i < currentStep)
          ? Behaviour.regular
          : (i == currentStep)
              ? Behaviour.processing
              : Behaviour.disabled;

      children.add(
        QStepItem(
          key: ValueKey('step_item_$i'),
          style: itemBehaviour == Behaviour.regular
              ? StepItemStyleSet.completed
              : StepItemStyleSet.standard,
          behaviour: itemBehaviour,
          stepNumber: i,
        ),
      );

      if (i < totalSteps) {
        final dividerBehaviour = (i < currentStep)
            ? Behaviour.regular
            : (i == currentStep)
                ? Behaviour.processing
                : Behaviour.disabled;
        children.add(
          Expanded(
            child: QStepDivider(
              style: StepDividerStyleSet.standard,
              behaviour: dividerBehaviour,
            ),
          ),
        );
      }
    }

    return Row(children: children);
  }
}
