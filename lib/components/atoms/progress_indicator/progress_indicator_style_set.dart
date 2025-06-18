part of 'progress_indicator_specs.dart';

enum ProgressIndicatorStyleSet {
  progressIndicatorSecondaryColor;

  const ProgressIndicatorStyleSet();

  ProgressIndicatorStyles get specs {
    return switch (this) {
      progressIndicatorSecondaryColor => ProgressIndicatorSpecs.progressIndicatorSecondaryColor,
    };
  }
}
