import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import 'step_indicator_component.dart';
import 'step_indicator_style.dart';

part 'step_indicator_style_set.dart';

class StepIndicatorSpecs extends StepIndicatorComponent {
  const StepIndicatorSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.currentStep,
    required super.totalSteps,
  });

  static StepIndicatorStyles get standard {
    return StepIndicatorStyles(
      shared: StepIndicatorSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(44, 24),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
        ),
      ),
      regular: StepIndicatorStyle(
        backgroundColor: Colors.blue,
        indicatorColor: Colors.red,
      ),
      disabled: StepIndicatorStyle(
        backgroundColor: Colors.grey[200]!,
        indicatorColor: Colors.red,
      ),
    );
  }
}
