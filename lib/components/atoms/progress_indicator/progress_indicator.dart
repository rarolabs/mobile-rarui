import 'progress_indicator_specs.dart';

class QProgressIndicator extends ProgressIndicatorSpecs {
  /// Style configurtion for [UProgressIndicator]
  final ProgressIndicatorStyleSet style;

  const QProgressIndicator({
    required this.style,
    super.key,
    required super.behaviour,
    required super.progress,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

  const QProgressIndicator.progressIndicatorSecondaryColor({
    super.key,
    required super.behaviour,
    required super.progress,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = ProgressIndicatorStyleSet.progressIndicatorSecondaryColor,
        super(
          styles: ProgressIndicatorStyleSet.progressIndicatorSecondaryColor,
        );
}
