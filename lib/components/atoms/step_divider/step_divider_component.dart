import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_widget.dart';
import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import 'step_divider_specs.dart';
import 'step_divider_style.dart';

class StepDividerComponent extends StatelessWidget with Component<StepDividerStyle, StepDividerSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Estilo do componente
  final StepDividerStyleSet styles;

  final double height;

  const StepDividerComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.height = 5,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<StepDividerStyle, StepDividerSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      processing: styles.specs.processing,
      disabled: styles.specs.disable,
    );
    return render(context, behaviour, style);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
      };

  @override
  Widget whenLoading(
    StepDividerStyle style,
    StepDividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    StepDividerStyle style,
    StepDividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _StepDivider(
      height: height,
      backgroundColors: style.backgroundColors,
    );
  }

  @override
  Widget whenDisabled(
    StepDividerStyle style,
    StepDividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _StepDivider(
      height: height,
      backgroundColors: style.backgroundColors,
    );
  }

  @override
  Widget whenProcessing(
    StepDividerStyle style,
    StepDividerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _StepDivider(
      height: height,
      backgroundColors: style.backgroundColors,
    );
  }
}

class _StepDivider extends StatelessWidget {
  final double height;
  final List<Color> backgroundColors;
  const _StepDivider({
    required this.height,
    required this.backgroundColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
